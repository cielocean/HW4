//multiplexer
//32 bits wide and 1 inputs deep

module mux32to1by1
(
output      out,
input[4:0]  address,
input[31:0] inputs
);

  assign out = inputs[address];

endmodule



//multiplexer
//32 bits wide and 32 inputs deep

module mux32to1by32
(
output[31:0]    	out,
input[4:0]      	address,
input[32*32-1:0]    inputs //(input0, input1, ..., input31)
);

  wire[31:0] mux[31:0]; // Create a 2D array of wires

  generate
	  genvar i;
	   for (i=0; i<32; i = i+1) begin: assignmuxblk
	  	assign mux[i] = inputs[32*i+31: 32*i];
	  end
  endgenerate

  assign out = mux[address]; // Connect the output of the array

endmodule
