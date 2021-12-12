/// @description Insert description here
// You can write your code in this editor
if (obj_player.gameOver == false)
{
switch(slimeState)
{
	case 2: //Attack player
		move_towards_point(obj_player.x, obj_player.y, speedx);
		break;
		
	case 1: //Recoil
		x += (-cos(recoilAngle * (pi / 180)) * recoilSpeed);
		y += (-sin(recoilAngle * (pi / 180)) * recoilSpeed);
		break;
		
	case 0: //sit.
		speed = 0;
		break;
	
	default:
		show_debug_message("something went wrong"); //Shouldn't happen
		break;
}
}