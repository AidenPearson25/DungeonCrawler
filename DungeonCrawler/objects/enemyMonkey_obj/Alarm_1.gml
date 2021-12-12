/// @description Insert description here
// You can write your code in this editor
state = monkey_state.idle; //Return to attacking
if(monkeyHealth <= 0) //Check if you need to die.
{
	instance_destroy();
}