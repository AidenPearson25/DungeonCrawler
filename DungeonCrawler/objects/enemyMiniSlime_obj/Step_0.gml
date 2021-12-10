switch(slimeState)
{
	case 1: //Recoil
		//move_towards_point(-obj_player.x, -obj_player.y, recoilSpeed); //Someone else needs to do this
		speed = recoilSpeed; //I'm directionally challenged.
		break;
	case 0: //move.
		move_towards_point(obj_player.x, obj_player.y, speedx);
		get_unstuck(enemyMiniSlime_obj);
		break;
	
	default:
		show_debug_message("something went wrong"); //Shouldn't happen
		break;
}