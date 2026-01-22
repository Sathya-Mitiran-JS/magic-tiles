module title_palette (
	input logic [3:0] index,
	output logic [3:0] Red, Green, Blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h0, 4'hF},
	{4'hD, 4'hD, 4'hF},
	{4'hF, 4'h0, 4'hF},
	{4'h9, 4'h9, 4'hF},
	{4'hF, 4'hF, 4'hF},
	{4'h6, 4'h0, 4'hF},
	{4'h9, 4'h0, 4'hF},
	{4'h4, 4'h4, 4'hE},
	{4'h3, 4'h0, 4'hF},
	{4'h6, 4'h6, 4'hE},
	{4'h0, 4'h0, 4'hF},
	{4'hF, 4'h0, 4'hF},
	{4'hC, 4'h0, 4'hF},
	{4'hB, 4'hB, 4'hF},
	{4'hD, 4'h1, 4'hD},
	{4'h2, 4'h2, 4'hE}
};

assign {Red, Green, Blue} = palette[index];

endmodule
