/// @description Recoil, maybe die, again
// You can write your code in this editor
bugState = 1; //Return to attacking
if(bugHealth <= 0) //Check if you need to die.
{
	instance_destroy();
}