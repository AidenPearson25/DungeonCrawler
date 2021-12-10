/// @description Take damage, maybe die.
// You can write your code in this editor
slimeState = 0; //Return to idling.
if(slimeHealth <= 0) //Check if you need to die.
{
	instance_destroy();
}