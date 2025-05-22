module tb1;
	reg [3:0] r1, r2;
	wire [3:0] w1, w1;

	logic [3:0] v1, v2;


	assign w1 = 1'b0011;	
	assign w2 = 1'b1100;

	initial begin
		assign r1 = 1'b0000;
		assign r2 = 1'b1111;
		$display("w1 = 'b%b, w2 = 'b%b", v1, v2);
	end

endmodule
