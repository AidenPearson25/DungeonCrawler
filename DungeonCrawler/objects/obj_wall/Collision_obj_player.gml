/// @description Insert description here
// You can write your code in this editor

switch (wallType)
{
	case 3: //Right
		if (obj_player.xSpeed > 0)
		{
			obj_player.xSpeed = 0;
		}
		break;
		
	case 2: //Down
		if (obj_player.ySpeed > 0)
		{
			obj_player.ySpeed = 0;
		}
		break;
		
	case 1: //Left
		if (obj_player.xSpeed < 0)
		{
			obj_player.xSpeed = 0;
		}
		break;
		
	case 0: //Top
		if (obj_player.ySpeed < 0)
		{
			obj_player.ySpeed = 0;
		}
		break;
		
	default:
		show_debug_message("Something went wrong"); //Shouldn't happen
		break;
}