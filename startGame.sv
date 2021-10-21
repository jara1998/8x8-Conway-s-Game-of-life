// Yunzhang Jiang
// EE 271 Lab 6
// this program simulates Conway's game of life in 8 X 8 LED board

// this module represents "startGame" mode
// takes 3 2-bit inputs and a 8x8 matrix as the initial values
// returns a 8x8 matrix
// if reset is 1, the game is at startGame mode
module startGame (reset, initial_array, out, clk, clk2);
	input logic reset, clk, clk2;
	input logic [7:0][7:0] initial_array; // changes with clk
	output logic [7:0][7:0] out;
	logic [7:0][7:0] temp; // changes with clk2, the output of LEDs
	
	always_ff @(posedge clk) begin
		if (reset) begin
			out <= initial_array;
		   // temp <= initial_array;
		end
		else begin
			out <= temp;
		end
	end
	
	LED C0x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(temp[0][1]), .B(0), .TR(temp[1][1]), .R(temp[1][0]), .L(0), .LL(0), .LR(0), .lightOn(temp[0][0]),
				 .init(initial_array[0][0]));
   LED C0x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(temp[0][2]), .B(temp[0][0]), .TR(temp[1][2]), .R(temp[1][1]), .L(0), .LL(0), .LR(temp[1][0]), .lightOn(temp[0][1]),
				 .init(initial_array[0][1]));
	LED C0x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(temp[0][3]), .B(temp[0][1]), .TR(temp[1][3]), .R(temp[1][2]), .L(0), .LL(0), .LR(temp[1][1]), .lightOn(temp[0][2]),
				 .init(initial_array[0][2]));
	LED C0x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(temp[0][4]), .B(temp[0][2]), .TR(temp[1][4]), .R(temp[1][3]), .L(0), .LL(0), .LR(temp[1][2]), .lightOn(temp[0][3]),
				 .init(initial_array[0][3]));
	LED C0x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(temp[0][5]), .B(temp[0][3]), .TR(temp[1][5]), .R(temp[1][4]), .L(0), .LL(0), .LR(temp[1][3]), .lightOn(temp[0][4]),
				 .init(initial_array[0][4]));
	LED C0x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(temp[0][6]), .B(temp[0][4]), .TR(temp[1][6]), .R(temp[1][5]), .L(0), .LL(0), .LR(temp[1][4]), .lightOn(temp[0][5]),
				 .init(initial_array[0][5]));
	LED C0x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(temp[0][7]), .B(temp[0][5]), .TR(temp[1][7]), .R(temp[1][6]), .L(0), .LL(0), .LR(temp[1][5]), .lightOn(temp[0][6]),
				 .init(initial_array[0][6]));
	LED C0x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[0][6]), .TR(0), .R(temp[1][7]), .L(0), .LL(0), .LR(temp[1][6]), .lightOn(temp[0][7]),
				 .init(initial_array[0][7]));
	
	
	LED C1x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[0][1]), .T(temp[1][1]), .B(0), .TR(temp[2][1]), .R(temp[2][0]), .L(temp[0][0]), .LL(0), .LR(0), .lightOn(temp[1][0]),
				 .init(initial_array[1][0]));
   LED C1x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[0][2]), .T(temp[1][2]), .B(temp[1][0]), .TR(temp[2][2]), .R(temp[2][1]), .L(temp[0][1]), .LL(temp[0][0]), .LR(temp[2][0]), .lightOn(temp[1][1]), .init(initial_array[1][1]));
	LED C1x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[0][3]), .T(temp[1][3]), .B(temp[1][1]), .TR(temp[2][3]), .R(temp[2][2]), .L(temp[0][2]), .LL(temp[0][1]), .LR(temp[2][1]), .lightOn(temp[1][2]), .init(initial_array[1][2]));
	LED C1x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[0][4]), .T(temp[1][4]), .B(temp[1][2]), .TR(temp[2][4]), .R(temp[2][3]), .L(temp[0][3]), .LL(temp[0][2]), .LR(temp[2][2]), .lightOn(temp[1][3]), .init(initial_array[1][3]));
	LED C1x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[0][5]), .T(temp[1][5]), .B(temp[1][3]), .TR(temp[2][5]), .R(temp[2][4]), .L(temp[0][4]), .LL(temp[0][3]), .LR(temp[2][3]), .lightOn(temp[1][4]), .init(initial_array[1][4]));
	LED C1x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[0][6]), .T(temp[1][6]), .B(temp[1][4]), .TR(temp[2][6]), .R(temp[2][5]), .L(temp[0][5]), .LL(temp[0][4]), .LR(temp[2][4]), .lightOn(temp[1][5]), .init(initial_array[1][5]));
	LED C1x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[0][7]), .T(temp[1][7]), .B(temp[1][5]), .TR(temp[2][7]), .R(temp[2][6]), .L(temp[0][6]), .LL(temp[0][5]), .LR(temp[2][5]), .lightOn(temp[1][6]), .init(initial_array[1][6]));
	LED C1x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[1][6]), .TR(0), .R(temp[2][7]), .L(temp[0][7]), .LL(temp[0][6]), .LR(temp[2][6]), .lightOn(temp[1][7]), 				  .init(initial_array[1][7]));
	
	
	LED C2x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[1][1]), .T(temp[2][1]), .B(0), .TR(temp[3][1]), .R(temp[3][0]), .L(temp[1][0]), .LL(0), .LR(0), .lightOn(temp[2][0]),
				 .init(initial_array[2][0]));
   LED C2x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[1][2]), .T(temp[2][2]), .B(temp[2][0]), .TR(temp[3][2]), .R(temp[3][1]), .L(temp[1][1]), .LL(temp[1][0]), .LR(temp[3][0]), .lightOn(temp[2][1]), .init(initial_array[2][1]));
	LED C2x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[1][3]), .T(temp[2][3]), .B(temp[2][1]), .TR(temp[3][3]), .R(temp[3][2]), .L(temp[1][2]), .LL(temp[1][1]), .LR(temp[3][1]), .lightOn(temp[2][2]), .init(initial_array[2][2]));
	LED C2x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[1][4]), .T(temp[2][4]), .B(temp[2][2]), .TR(temp[3][4]), .R(temp[3][3]), .L(temp[1][3]), .LL(temp[1][2]), .LR(temp[3][2]), .lightOn(temp[2][3]), .init(initial_array[2][3]));
	LED C2x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[1][5]), .T(temp[2][5]), .B(temp[2][3]), .TR(temp[3][5]), .R(temp[3][4]), .L(temp[1][4]), .LL(temp[1][3]), .LR(temp[3][3]), .lightOn(temp[2][4]), .init(initial_array[2][4]));
	LED C2x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[1][6]), .T(temp[2][6]), .B(temp[2][4]), .TR(temp[3][6]), .R(temp[3][5]), .L(temp[1][5]), .LL(temp[1][4]), .LR(temp[3][4]), .lightOn(temp[2][5]), .init(initial_array[2][5]));
	LED C2x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[1][7]), .T(temp[2][7]), .B(temp[2][5]), .TR(temp[3][7]), .R(temp[3][6]), .L(temp[1][6]), .LL(temp[1][5]), .LR(temp[3][5]), .lightOn(temp[2][6]), .init(initial_array[2][6]));
	LED C2x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[2][6]), .TR(0), .R(temp[3][7]), .L(temp[1][7]), .LL(temp[1][6]), .LR(temp[3][6]), .lightOn(temp[2][7]), 				  .init(initial_array[2][7]));
	
	
	LED C3x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[2][1]), .T(temp[3][1]), .B(0), .TR(temp[4][1]), .R(temp[4][0]), .L(temp[2][0]), .LL(0), .LR(0), .lightOn(temp[3][0]),
				 .init(initial_array[3][0]));
   LED C3x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[2][2]), .T(temp[3][2]), .B(temp[3][0]), .TR(temp[4][2]), .R(temp[4][1]), .L(temp[2][1]), .LL(temp[2][0]), .LR(temp[4][0]), .lightOn(temp[3][1]), .init(initial_array[3][1]));
	LED C3x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[2][3]), .T(temp[3][3]), .B(temp[3][1]), .TR(temp[4][3]), .R(temp[4][2]), .L(temp[2][2]), .LL(temp[2][1]), .LR(temp[4][1]), .lightOn(temp[3][2]), .init(initial_array[3][2]));
	LED C3x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[2][4]), .T(temp[3][4]), .B(temp[3][2]), .TR(temp[4][4]), .R(temp[4][3]), .L(temp[2][3]), .LL(temp[2][2]), .LR(temp[4][2]), .lightOn(temp[3][3]), .init(initial_array[3][3]));
	LED C3x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[2][5]), .T(temp[3][5]), .B(temp[3][3]), .TR(temp[4][5]), .R(temp[4][4]), .L(temp[2][4]), .LL(temp[2][3]), .LR(temp[4][3]), .lightOn(temp[3][4]), .init(initial_array[3][4]));
	LED C3x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[2][6]), .T(temp[3][6]), .B(temp[3][4]), .TR(temp[4][6]), .R(temp[4][5]), .L(temp[2][5]), .LL(temp[2][4]), .LR(temp[4][4]), .lightOn(temp[3][5]), .init(initial_array[3][5]));
	LED C3x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[2][7]), .T(temp[3][7]), .B(temp[3][5]), .TR(temp[4][7]), .R(temp[4][6]), .L(temp[2][6]), .LL(temp[2][5]), .LR(temp[4][5]), .lightOn(temp[3][6]), .init(initial_array[3][6]));
	LED C3x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[3][6]), .TR(0), .R(temp[4][7]), .L(temp[2][7]), .LL(temp[2][6]), .LR(temp[4][6]), .lightOn(temp[3][7]),
				 .init(initial_array[3][7]));
	
	
	LED C4x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[3][1]), .T(temp[4][1]), .B(0), .TR(temp[5][1]), .R(temp[5][0]), .L(temp[3][0]), .LL(0), .LR(0), .lightOn(temp[4][0]),
				 .init(initial_array[4][0]));
   LED C4x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[3][2]), .T(temp[4][2]), .B(temp[4][0]), .TR(temp[5][2]), .R(temp[5][1]), .L(temp[3][1]), .LL(temp[3][0]), .LR(temp[5][0]), .lightOn(temp[4][1]), .init(initial_array[4][1]));
	LED C4x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[3][3]), .T(temp[4][3]), .B(temp[4][1]), .TR(temp[5][3]), .R(temp[5][2]), .L(temp[3][2]), .LL(temp[3][1]), .LR(temp[5][1]), .lightOn(temp[4][2]), .init(initial_array[4][2]));
	LED C4x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[3][4]), .T(temp[4][4]), .B(temp[4][2]), .TR(temp[5][4]), .R(temp[5][3]), .L(temp[3][3]), .LL(temp[3][2]), .LR(temp[5][2]), .lightOn(temp[4][3]), .init(initial_array[4][3]));
	LED C4x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[3][5]), .T(temp[4][5]), .B(temp[4][3]), .TR(temp[5][5]), .R(temp[5][4]), .L(temp[3][4]), .LL(temp[3][3]), .LR(temp[5][3]), .lightOn(temp[4][4]), .init(initial_array[4][4]));
	LED C4x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[3][6]), .T(temp[4][6]), .B(temp[4][4]), .TR(temp[5][6]), .R(temp[5][5]), .L(temp[3][5]), .LL(temp[3][4]), .LR(temp[5][4]), .lightOn(temp[4][5]), .init(initial_array[4][5]));
	LED C4x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[3][7]), .T(temp[4][7]), .B(temp[4][5]), .TR(temp[5][7]), .R(temp[5][6]), .L(temp[3][6]), .LL(temp[3][5]), .LR(temp[5][5]), .lightOn(temp[4][6]), .init(initial_array[4][6]));
	LED C4x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[4][6]), .TR(0), .R(temp[5][7]), .L(temp[3][7]), .LL(temp[3][6]), .LR(temp[5][6]), .lightOn(temp[4][7]),
				.init(initial_array[4][7]));


	LED C5x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[4][1]), .T(temp[5][1]), .B(0), .TR(temp[6][1]), .R(temp[6][0]), .L(temp[4][0]), .LL(0), .LR(0), .lightOn(temp[5][0]),
				 .init(initial_array[5][0]));
   LED C5x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[4][2]), .T(temp[5][2]), .B(temp[5][0]), .TR(temp[6][2]), .R(temp[6][1]), .L(temp[4][1]), .LL(temp[4][0]), .LR(temp[6][0]), .lightOn(temp[5][1]), .init(initial_array[5][1]));
	LED C5x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[4][3]), .T(temp[5][3]), .B(temp[5][1]), .TR(temp[6][3]), .R(temp[6][2]), .L(temp[4][2]), .LL(temp[4][1]), .LR(temp[6][1]), .lightOn(temp[5][2]), .init(initial_array[5][2]));
	LED C5x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[4][4]), .T(temp[5][4]), .B(temp[5][2]), .TR(temp[6][4]), .R(temp[6][3]), .L(temp[4][3]), .LL(temp[4][2]), .LR(temp[6][2]), .lightOn(temp[5][3]), .init(initial_array[5][3]));
	LED C5x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[4][5]), .T(temp[5][5]), .B(temp[5][3]), .TR(temp[6][5]), .R(temp[6][4]), .L(temp[4][4]), .LL(temp[4][3]), .LR(temp[6][3]), .lightOn(temp[5][4]), .init(initial_array[5][4]));
	LED C5x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[4][6]), .T(temp[5][6]), .B(temp[5][4]), .TR(temp[6][6]), .R(temp[6][5]), .L(temp[4][5]), .LL(temp[4][4]), .LR(temp[6][4]), .lightOn(temp[5][5]), .init(initial_array[5][5]));
	LED C5x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[4][7]), .T(temp[5][7]), .B(temp[5][5]), .TR(temp[6][7]), .R(temp[6][6]), .L(temp[4][6]), .LL(temp[4][5]), .LR(temp[6][5]), .lightOn(temp[5][6]), .init(initial_array[5][6]));
	LED C5x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[5][6]), .TR(0), .R(temp[6][7]), .L(temp[4][7]), .LL(temp[4][6]), .LR(temp[6][6]), .lightOn(temp[5][7]),
				 .init(initial_array[5][7]));
	
	
	LED C6x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[5][1]), .T(temp[6][1]), .B(0), .TR(temp[7][1]), .R(temp[7][0]), .L(temp[5][0]), .LL(0), .LR(0), .lightOn(temp[6][0]),
				 .init(initial_array[6][0]));
   LED C6x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[5][2]), .T(temp[6][2]), .B(temp[6][0]), .TR(temp[7][2]), .R(temp[7][1]), .L(temp[5][1]), .LL(temp[5][0]), .LR(temp[7][0]), .lightOn(temp[6][1]), .init(initial_array[6][1]));
	LED C6x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[5][3]), .T(temp[6][3]), .B(temp[6][1]), .TR(temp[7][3]), .R(temp[7][2]), .L(temp[5][2]), .LL(temp[5][1]), .LR(temp[7][1]), .lightOn(temp[6][2]), .init(initial_array[6][2]));
	LED C6x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[5][4]), .T(temp[6][4]), .B(temp[6][2]), .TR(temp[7][4]), .R(temp[7][3]), .L(temp[5][3]), .LL(temp[5][2]), .LR(temp[7][2]), .lightOn(temp[6][3]), .init(initial_array[6][3]));
	LED C6x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[5][5]), .T(temp[6][5]), .B(temp[6][3]), .TR(temp[7][5]), .R(temp[7][4]), .L(temp[5][4]), .LL(temp[5][3]), .LR(temp[7][3]), .lightOn(temp[6][4]), .init(initial_array[6][4]));
	LED C6x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[5][6]), .T(temp[6][6]), .B(temp[6][4]), .TR(temp[7][6]), .R(temp[7][5]), .L(temp[5][5]), .LL(temp[5][4]), .LR(temp[7][4]), .lightOn(temp[6][5]), .init(initial_array[6][5]));
	LED C6x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[5][7]), .T(temp[6][7]), .B(temp[6][5]), .TR(temp[7][7]), .R(temp[7][6]), .L(temp[5][6]), .LL(temp[5][5]), .LR(temp[7][5]), .lightOn(temp[6][6]), .init(initial_array[6][6]));
	LED C6x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[6][6]), .TR(0), .R(temp[7][7]), .L(temp[5][7]), .LL(temp[5][6]), .LR(temp[7][6]), .lightOn(temp[6][7]),              .init(initial_array[6][7]));
	
	
	LED C7x0 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[6][1]), .T(temp[7][1]), .B(0), .TR(0), .R(0), .L(temp[6][0]), .LL(0), .LR(0), .lightOn(temp[7][0]),
				 .init(initial_array[7][0]));
   LED C7x1 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[6][2]), .T(temp[7][2]), .B(temp[7][0]), .TR(0), .R(0), .L(temp[6][1]), .LL(temp[6][0]), .LR(0), .lightOn(temp[7][1]),
				 .init(initial_array[7][1]));
	LED C7x2 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[6][3]), .T(temp[7][3]), .B(temp[7][1]), .TR(0), .R(0), .L(temp[6][2]), .LL(temp[6][1]), .LR(0), .lightOn(temp[7][2]),
				 .init(initial_array[7][2]));
	LED C7x3 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[6][4]), .T(temp[7][4]), .B(temp[7][2]), .TR(0), .R(0), .L(temp[6][3]), .LL(temp[6][2]), .LR(0), .lightOn(temp[7][3]),
				 .init(initial_array[7][3]));
	LED C7x4 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[6][5]), .T(temp[7][5]), .B(temp[7][3]), .TR(0), .R(0), .L(temp[6][4]), .LL(temp[6][3]), .LR(0), .lightOn(temp[7][4]),
				 .init(initial_array[7][4]));
	LED C7x5 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[6][6]), .T(temp[7][6]), .B(temp[7][4]), .TR(0), .R(0), .L(temp[6][5]), .LL(temp[6][4]), .LR(0), .lightOn(temp[7][5]),
				 .init(initial_array[7][5]));
	LED C7x6 (.clk(clk), .clk2(clk2), .reset(reset), .TL(temp[6][7]), .T(temp[7][7]), .B(temp[7][5]), .TR(0), .R(0), .L(temp[6][6]), .LL(temp[6][5]), .LR(0), .lightOn(temp[7][6]),
				 .init(initial_array[7][6]));
	LED C7x7 (.clk(clk), .clk2(clk2), .reset(reset), .TL(0), .T(0), .B(temp[7][6]), .TR(0), .R(0), .L(temp[6][7]), .LL(temp[6][6]), .LR(0), .lightOn(temp[7][7]),
				 .init(initial_array[7][7]));
			 
				 
endmodule

	
	
	