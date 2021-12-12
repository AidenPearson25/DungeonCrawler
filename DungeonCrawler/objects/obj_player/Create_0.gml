
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
invincibility = false;

//Recoil variables
recoilTime = 10;
recoilSpeed = 1.25;
recoilAngle = 0;
iframesTime = 30; //How much time before the player can take more damage
iframes = false;

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
equippedWeapon = obj_sword;
xAttackDirection = 0; //x attack direction
yAttackDirection = 0; //y attack direction
attackDuration =  15; //How long the attacking state lasts
attackEndLag = 12; //How long between attacks

//Equipment
//playerWeapon = obj_sword; //Do something like this so that later when we have multiple weapons, we can have the enemies just get the player weapon when taking damage.

//Stats
playerMaxHealth = 5; //How much health you can have
playerHealth = 5; //How much health you currently have
playerDefense = 5; //How much resistance you currently have
damageReduction = playerDefense * 0.01; //Not using this for now, but we can return to this once we make armor.