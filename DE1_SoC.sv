// Yunzhang Jiang
// EE 271 Lab 6
// this program simulates Conway's game of life in 8 X 8 LED board

// takes a 4-bit input KEY, a 10 bit input SW
// returns 6 7-bit output "HEX" and a 10-bit output LEDR
// connects the design of the game of life to an 8x8 LED board
module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	input logic CLOCK_50; // 50MHz clock.
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY; // True when not pressed, False when pressed
	input logic [9:0] SW;
	output logic [35:0] GPIO_0; 
	logic t_KEY3; // confirm buttom
	logic next;

	assign LEDR[0] = SW[0];
	assign LEDR[1] = SW[1];
	assign LEDR[2] = SW[2];
	assign LEDR[3] = SW[3];
	assign LEDR[4] = SW[4];
	assign LEDR[5] = SW[5];
	assign LEDR[6] = SW[6];
	assign LEDR[7] = SW[7];
	
	logic [7:0][7:0] red_array, green_array, initial_array;
	

	/*
	// light test
   assign green_array [0] = 8'b10000000;
	assign green_array [6] = 8'b11000000;
	assign green_array [2] = 8'b11100000;
	assign green_array [3] = 8'b11110000;
   assign green_array [4] = 8'b11111000;
	assign green_array [5] = 8'b11111100;
	assign green_array [1] = 8'b11111110;
   assign green_array [7] = 8'b11111111;
	*/
	
	/*
	// coordinate test
	assign green_array[0][0] = 1;
	assign green_array[0][6] = 1;
   assign green_array[2][0] = 1;
	assign green_array[2][7] = 1;
	*/
	
	
	//metastablity treatment
	inputs meta (.in(~KEY[3]), .clk(clk), .out(t_KEY3), .reset(SW[8]));
	
	
	//keepPressing treatment
	avoidKeepPressing AKP (.reset(SW[8]), .clk(clk), .in(t_KEY3), .out(next));
	
	
	logic [31:0] clk;
	parameter whichClock = 10; // refresh rate
	clock_divider cdiv (CLOCK_50, clk);
	parameter whichClock2 = 25; // slower clock for the game

	
	
	seed SG (.clk(clk), .in(SW[7:0]), .out(initial_array), .next(next), .HEX0(HEX0), .reset(~SW[9]));
	
	startGame start (.reset(~SW[9]), .initial_array(initial_array), .out(green_array), .clk(clk[whichClock]), .clk2(clk[whichClock2]));
	
	led_matrix_driver driver (.clock(clk), .red_array(red_array), .green_array(green_array), .red_driver(GPIO_0[27:20]), .green_driver(GPIO_0[35:28]), .row_sink(GPIO_0[19:12])); // matrix driver
	

			assign HEX1 = 7'b1111111;
			assign HEX2 = 7'b1111111;
			assign HEX3 = 7'b1111111;
			assign HEX4 = 7'b1111111;
			assign HEX5 = 7'b1111111;


	
	
endmodule




// a clock generator that generates 32 clocks that have different speeds 
module clock_divider (clock, divided_clocks);
	input logic clock;
	output logic [31:0] divided_clocks;
	initial begin
		divided_clocks <= 0;
	end
	always_ff @(posedge clock) begin
		divided_clocks <= divided_clocks + 1;
	end
endmodule







// metastability treatment
// takes in 3 inputs "in", "clk" and "reset"
// returns a output without metastability
module inputs (in, clk, out, reset);
	input logic in;
	output logic out;
	input logic clk;
	input logic reset;
	logic temp;
	
	always_ff@(posedge clk) begin 
		if (reset) 
			out <= 1'b0;
		else begin
			temp <= in;
			out <= temp;
		end
	end
endmodule



	  

 