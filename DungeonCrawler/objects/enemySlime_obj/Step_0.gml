/// @description Insert description here
// You can write your code in this editor
switch(slimeState)
{
	case 2: //Attack player
		//Code for attacking the player.
		break;
	case 1: //Recoil
		speed = 2;
		break;
	case 0: //sit.
		speed = 0;
		break;
	
	default:
		show_debug_message("something went wrong"); //Shouldn't happen
		break;
}