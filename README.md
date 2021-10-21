# 9x9-Conway-s-Game-of-life

# logic 

There 2 main steps in the process of designing. First one is dealing with user’s input and the
second one is making the pattern changes automatically.
In step 1, I set KEY[3] as a user input that controls which row the user is on. Since my design is
on 8x8 led board, I chose SW[7:0] to control which leds on current row are on/off.
In step 2, I wrote the a module for 64 leds and write the logic of game of life as a FSM.

