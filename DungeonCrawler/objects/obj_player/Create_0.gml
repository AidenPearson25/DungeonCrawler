
//Controls
upKey = "W"; //Default up key
leftKey = "A"; //Default left key
downKey = "S"; //Default down key
rightKey = "D"; //Default right key

attackKey = "J"; //Default attack key
rollKey = "K"; //Default dodge key
defendKey = "L"; //Default defend key

//States
image_speed = 0;
currentState = 0;

//Movement variables
xSpeed = 0; //How much x to change per frame
ySpeed = 0; //How much y to change per frame
xInput = 0; //What x direction is pressed
yInput = 0; //What y direction is pressed
moveSpeed = 1.25; //How fast you move

xAcceleration = 0; //Ease for x
yAcceleration = 0; //Ease for y

//Rolling variables
lastDirection = 0; //Last direction you faced
xRollDirection = 0; //x roll direction
yRollDirection = 0; //y roll direction
rollInvincibility = false; //Start of roll makes you invincible 
rollSpeed = 3.75; //How fast you roll
rollDuration = 10; //How long the roll lasts
rollEndLag = 10; //How long you're vulnerable after rolling

//Attack variables
xAttackDirection = 0; //x attack direction
yAttackDirection = 0; //y attack direction
attackDuration =  15; //How long the attacking state lasts
attackEndLag = 12; //How long between attacks
