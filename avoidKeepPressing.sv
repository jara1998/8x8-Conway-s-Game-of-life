// Yunzhang Jiang
// EE 271 Lab 6
// this program simulates Conway's game of life in 8 X 8 LED board

// takes 3 1-bit inputs in, clk and reset
// return a 1-bit filtered output
// the output will be true for only one clock period if the input is a constant true
module avoidKeepPressing (reset, clk, in, out);
	input logic in, clk, reset;
	output logic out;
	
	enum {A, B} ps, ns; // A for not pressing, B for pressing
	
	always_ff @(posedge clk) begin
		if (reset) 
			ps <= A;
		else 
			ps <= ns;
	end
	
	always_comb begin
		case (ps) 
			A: if (~in) begin 
				ns = A;
				out = 0;
				end 
				
				else begin 
					ns = B;
					out = 1;
					end
					
			B: if (in) begin 
					ns = B;
					out = 0;
					end
				else begin
					ns = A;
					out = 0;
				end
		endcase
	end
endmodule
