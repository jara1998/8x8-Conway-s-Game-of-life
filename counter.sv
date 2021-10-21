// Yunzhang Jiang
// EE 271 Lab 6
// this program simulates Conway's game of life on an 8 X 8 LED board

// takes 8 1-bit inputs
// returns a 4-bit output that counts how many inputs are 1
module counter (TL, T, B, TR, R, L, LL, LR, neighbours);
	input logic TL, T, B, TR, R, L, LL, LR;
	output logic [3:0] neighbours;
	
	assign neighbours = TL + T + B + TR + R + L + LL + LR;
endmodule

// testbench for counter
module counter_tb();
	logic TL, T, B, TR, R, L, LL, LR;
	logic [3:0] neighbours;
	logic [7:0] nb;
	
	assign TL = nb[0];
	assign T = nb[1];
	assign B = nb[2];
	assign TR = nb[3];
	assign R = nb[4];
	assign L = nb[5];
	assign LL = nb[6];
	assign LR = nb[7];
	
	counter dut (.TL(TL), .T(T), .B(B), .TR(TR), .R(R), .L(L), .LL(LL), .LR(LR), .neighbours(neighbours));
	
	initial begin
		nb <= 8'b01010100; #10;
		nb <= 8'b00000000; #10;
		nb <= 8'b10111111; #10;
	end
endmodule

		

		
		