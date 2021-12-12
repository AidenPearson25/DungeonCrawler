if (obj_player.gameOver == false)
{
switch(slimeState)
{
	case 1: //Recoil
	with (obj_wall)
		{
			if (place_meeting(x, y, enemyMiniSlime_obj))
			{
				
						if (enemyMiniSlime_obj.recoilSpeed > 0)
						{
							enemyMiniSlime_obj.recoilSpeed = 0;
						}
							
			}
			else
			{
				enemyMiniSlime_obj.recoilSpeed = 2;
			}
		}
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
}