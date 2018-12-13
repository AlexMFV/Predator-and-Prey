# Predator and Prey
Predator and Prey in a style of "Game of Life" made in Processing.

# Rules
#### (All the values can be changed these are the defaults)

- Firstly, there are 2 type of dots:
  - The predator, which are the red dots;
  - The prey, which are the green dots;

- The game starts with:
  - 500 predators;
  - 500 preys;
  - Each predator is given random **HP** between 500 and 1000;
  - Each prey is given between 350 and 500 **HP** *(threshold)*

- Each iteration:
  - Each predator moves one pixel in any direction;
  - Each prey also moves one pixel in any direction;
  - Each predator loses 1 **HP**;
  - Each prey gains 1 **HP**;
  
- Scenarios:
  - If a predator is next to a prey:
    - It eats the prey;
    - Gains the ammount of HP of the prey;
  - If a prey's **HP** reaches the threshold the prey has a baby;
  - If a prey gets eaten it transforms into a new predator;
  - If a predator's **HP** reaches 0, it dies;
  - If a prey has had more than 2 babies, it dies;
  
  

 # Screenshot
 
 ![Alt text](/Predator_Prey/Screenshot/Predator_Prey.png?raw=true "Wooah")
