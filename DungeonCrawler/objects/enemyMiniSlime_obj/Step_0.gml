switch(slimeState)
{
	case 1: //Recoil
		x += (-cos(recoilAngle * (pi / 180)) * recoilSpeed);
		y += (-sin(recoilAngle * (pi / 180)) * recoilSpeed);
		break;
	case 0: //move.
		move_towards_point(obj_player.x, obj_player.y, speedx);
		get_unstuck(enemyMiniSlime_obj);
		break;
	
	default:
		show_debug_message("something went wrong"); //Shouldn't happen
		break;
}