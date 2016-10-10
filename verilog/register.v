// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule



// 32 bit D Flip-Flop with enable
// Positive edge triggered

module register32
#(parameter n=32, parameter m=n-1)
(
output reg	[m:0] q,
input		[m:0] d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule



// 32 bit D Flip-Flop with enable
// Positive edge triggered

module register32zero
#(parameter n=32, parameter m=n-1)
(
output reg	[m:0] q,
input		[m:0] d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = {m{1'b0}};
        end
    end

endmodule



