/// @description Recoil, maybe die, again
// You can write your code in this editor
bugState = 0; //Return to attacking
if(bugHealth <= 0) //Check if you need to die.
{
	audio_stop_sound(ladybug_mp3);
	instance_destroy();
}