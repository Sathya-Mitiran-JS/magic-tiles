#include <stdio.h>
#include "platform.h"

#include "lw_usb/GenericMacros.h"
#include "lw_usb/GenericTypeDefs.h"
#include "lw_usb/MAX3421E.h"
#include "lw_usb/USB.h"
#include "lw_usb/usb_ch9.h"
#include "lw_usb/transfer.h"
#include "lw_usb/HID.h"

#include "xparameters.h"
#include "xgpio.h"
#include <string.h>

extern HID_DEVICE hid_device;

static XGpio Gpio_keycodes;

// Hard-coded USB address for device table
static BYTE addr = 1;

// Track device class
static BYTE current_device = 0xFF;

// Track previous keycodes for change detection
static BOOT_KBD_REPORT prev_report;

/*
 * Helper: send keycodes to FPGA fabric
 */
void SendKeycodesToFPGA(const BOOT_KBD_REPORT *k)
{
    // Pack first 4 keycodes into channel 1 (32-bit)
    u32 word0 =
        (k->keycode[3] << 24) |
        (k->keycode[2] << 16) |
        (k->keycode[1] << 8)  |
         k->keycode[0];

    // Last two keycodes into channel 2 (16-bit)
    u32 word1 =
        (k->keycode[4]) |
        (k->keycode[5] << 8);

    XGpio_DiscreteWrite(&Gpio_keycodes, 1, word0);
    XGpio_DiscreteWrite(&Gpio_keycodes, 2, word1);
}

/*
 * Identify connected USB device class
 */
BYTE DetectDeviceClass()
{
    BYTE i;
    DEV_RECORD *ptr;

    for (i = 1; i < USB_NUMDEVICES; i++) {
        ptr = GetDevtable(i);
        if (ptr->epinfo != NULL)
            return ptr->devclass;
    }
    return 0xFF;
}

/*
 * Main: Magic Tiles Keyboard Reader
 */
int main()
{
    init_platform();
    memset(&prev_report, 0, sizeof(prev_report));

    XGpio_Initialize(&Gpio_keycodes, XPAR_GPIO_USB_KEYCODE_DEVICE_ID);
    XGpio_SetDataDirection(&Gpio_keycodes, 1, 0x00000000);  // Output
    XGpio_SetDataDirection(&Gpio_keycodes, 2, 0x00000000);  // Output

    MAX3421E_init();
    USB_init();

    BOOT_KBD_REPORT kbd;
    memset(&kbd, 0, sizeof(kbd));

    while (1)
    {
        // Run low-level USB handler
        MAX3421E_Task();
        USB_Task();

        BYTE usb_state = GetUsbTaskState();

        if (usb_state == USB_STATE_RUNNING)
        {
            BYTE detected = DetectDeviceClass();

            // New keyboard connection
            if (detected == HID_K && current_device != HID_K)
            {
                xil_printf("Keyboard detected!\n");
                current_device = HID_K;
                memset(&prev_report, 0, sizeof(prev_report));
            }

            // Disconnect
            if (detected != HID_K && current_device == HID_K)
            {
                xil_printf("Keyboard disconnected.\n");
                current_device = 0xFF;

                // Clear inputs
                BOOT_KBD_REPORT empty = {0};
                SendKeycodesToFPGA(&empty);
            }

            // If keyboard is present, poll keys
            if (current_device == HID_K)
            {
                BYTE r = kbdPoll(&kbd);

                if (r == hrNAK)
                    continue;   // no new data
                if (r != 0)     // error
                    continue;

                // Send if keys changed
                if (memcmp(&kbd, &prev_report, sizeof(kbd)) != 0)
                {
                    SendKeycodesToFPGA(&kbd);

                    xil_printf("Keys: ");
                    for (int i = 0; i < 6; i++)
                    {
                        if (kbd.keycode[i] != 0)
                            xil_printf("0x%02X ", kbd.keycode[i]);
                    }
                    xil_printf("\n");

                    memcpy(&prev_report, &kbd, sizeof(kbd));
                }
            }
        }
        else
        {
            // Not running → USB not ready
            if (current_device == HID_K)
            {
                xil_printf("USB left RUNNING state, clearing...\n");
                current_device = 0xFF;

                BOOT_KBD_REPORT empty = {0};
                SendKeycodesToFPGA(&empty);
            }
        }
    }

    cleanup_platform();
    return 0;
}
