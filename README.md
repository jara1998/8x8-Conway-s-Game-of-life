# 9x9-Conway-s-Game-of-life

# logic 

There 2 main steps in the process of designing. First one is dealing with user’s input and the
second one is making the pattern changes automatically.
In step 1, I set KEY[3] as a user input that controls which row the user is on. Since my design is
on 8x8 led board, I chose SW[7:0] to control which leds on current row are on/off.
In step 2, I wrote the a module for 64 leds and write the logic of game of life as a FSM.

![image](https://user-images.githubusercontent.com/58502695/138345252-5b2a0a7a-42a9-4c58-ac9b-b91afedf5862.png)

![image](https://user-images.githubusercontent.com/58502695/138345277-4fe5ceef-25ed-40f6-a945-5f8f292dae32.png)


# The rules of game of life:

1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overpopulation.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by
reproduction.

# User manual:

The game has 2 modes: Start Game & Initialize. You can switch the modes by using Switch[9],
“on” is start game, “off” is initialize. In the initialization mode, you can give an initial pattern to the
8x8 led board. KEY[3] controls which row you are on and switch[7:0] controls which leds are
on/off. Once you turn on the Switch[9], the game will start. If you turn off switch[9] in “start
game” mode, the game will go back to the initial pattern that you set.


![image](https://user-images.githubusercontent.com/58502695/138345438-c9a34961-d664-4bba-8070-952f873ad706.png)
Picture of the 9x9 board and FPGA.
