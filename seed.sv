// Yunzhang Jiang
// EE 271 Lab 6
// this program simulates Conway's game of life in 8 X 8 LED board

// takes 3 2-bit inputs and a 8-bit value
// returns a 8x8 matrix and a 7-bit value that represent 
// that the index of the row the player is on
// gives a initialized matrix and pass it to startGame module
module seed (clk, in, out, next, HEX0, reset);

	input logic clk, next, reset;
	input logic [7:0] in; // number indicated by the switches
	output logic [7:0][7:0] out;
	output logic [6:0] HEX0;
	logic [2:0] count;
	
	always_comb begin
		case (count)
			3'd0: HEX0 = 7'b1111001;
			3'd1: HEX0 = 7'b0100100;
			3'd2: HEX0 = 7'b0110000;
			3'd3: HEX0 = 7'b0011001;
			3'd4: HEX0 = 7'b0010010;
			3'd5: HEX0 = 7'b0000010;
			3'd6: HEX0 = 7'b1111000;
			3'd7: HEX0 = 7'b0000000;
		endcase
	end
			
	
	always_ff @(posedge next) begin
		if (reset)
			count <= count + 3'b001;
	end
	
	always_ff @(posedge next) begin
		if (reset)
			out[count] <= in;
			
	end
endmodule

	
// testbench for seed
module seed_tb ();
	logic clk, reset, next;
	logic [7:0] in; // number indicated by the switches
	logic [7:0][7:0] out;
	logic [6:0] HEX0;
	
	seed dut (.clk(clk), .in(in), .out(out), .next(next), .HEX0(HEX0), .reset(reset));
	
	parameter CLOCK_PERIOD=100;
	
 initial begin
	next <= 0;
	forever #(CLOCK_PERIOD/2) next <= ~next;
 end
		
	initial begin
		in <= 8'b01010101; @(posedge next);
		reset <= 1;  @(posedge next);
		in <= 8'b10101010; @(posedge next);
		in <= 8'b01010101; @(posedge next);
		in <= 8'b10101010; @(posedge next);
		in <= 8'b01010101; @(posedge next);
		in <= 8'b10101010; @(posedge next);
		
	end
endmodule
		
		
		
		
		
		
		
		
		
		
		
		
		
		



