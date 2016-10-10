//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "decoders.v"
`include "register.v"
`include "mux.v"

module regfile
(
output[31:0]    ReadData1,      // Contents of first register read
output[31:0]    ReadData2,      // Contents of second register read
input[31:0]     WriteData,      // Contents to write to register
input[4:0]      ReadRegister1,  // Address of first register to read
input[4:0]      ReadRegister2,  // Address of second register to read
input[4:0]      WriteRegister,  // Address of register to write
input           RegWrite,       // Enable writing of register when High
input           Clk             // Clock (Positive Edge Triggered)
);


	//Decoder
	wire [31:0] decoderOut;
	decoder1to32 decoder(decoderOut, RegWrite, WriteRegister);



	//Register
	wire [32*32-1:0] registers; //32*32 double array as vector

	register32zero reg0(registers[31:0], WriteData, decoderOut[0], Clk);
	generate
		genvar i;
			for (i=1; i<32; i = i+1) begin: registerblk
	  	 		register32 reg_i(registers[32*i+31:32*i], WriteData, decoderOut[i], Clk);
		end
  	endgenerate



  	//Multiplexers  

  	//Multiplexer 1
  		mux32to1by32 mux1(ReadData1, ReadRegister1, registers);

  	//Multiplexer 2
  		mux32to1by32 mux2(ReadData2, ReadRegister2, registers);



endmodule