// Yunzhang Jiang
// EE 271 Lab 6
// this program simulates Conway's game of life in 8 X 8 LED board

// this module simulates the behavior of a LED on the 8x8 LED board
// takes in 12 1-bit inputs
// returns a 1-bit output that decides if the led is on or not
module LED (clk, clk2, reset, TL, T, B, TR, R, L, LL, LR, lightOn, init);
	input logic clk, clk2, reset, TL, T, B, TR, R, L, LL, LR, init;
	output logic lightOn;
	logic C, D;
	logic [3:0] neighbours;
	logic ps, ns;
	
	assign C = 0;
	assign D = 1;
	
	counter ct (.TL(TL), .T(T), .B(B), .TR(TR), .R(R), .L(L), .LL(LL), .LR(LR), .neighbours(neighbours)); // count # of the neighbours endlessly
	
	always_comb begin
		case (ps)
			D: if (neighbours == 4'd2 || neighbours == 4'd3) ns = D; // keep living
				else ns = C; // lonliness and overpopulation
			C: if (neighbours == 4'd3) ns = D; // gives birth
				else ns = C; // still dead
			default: ns = C;
		endcase
	end
	
	always_ff @(posedge clk2) begin
		if (reset)
			ps <= init;
		else
			ps <= ns;
	end
		
	
	assign lightOn = (ps == D);
endmodule

// testbench for LED.sv
module LED_tb();
	logic clk, clk2, reset, TL, T, B, TR, R, L, LL, LR, init;
	logic lightOn;
	
	LED dut (.clk(clk), .clk2(clk2), .reset(reset), .TL(TL), .T(T), .B(B), .TR(TR), .R(R), .L(L), .LL(LL), .LR(LR), .lightOn(lightOn), .init(init));
	
	parameter CLOCK_PERIOD=100;
 initial begin
	clk2 <= 0;
	forever #(CLOCK_PERIOD/2) clk2 <= ~clk2;
 end
	
	initial begin
		reset <= 0; @(posedge clk2);
		init <= 0;  @(posedge clk2);
		TL <= 1; T <= 1; B <= 1; R<=0; LL <= 0; LR<=0; L<=0; TR<=0; @(posedge clk2);@(posedge clk2);
		TL <= 0; R <= 1; LL <= 1; LR <= 1; L <= 1; @(posedge clk2);@(posedge clk2);		
	end
endmodule

	
			