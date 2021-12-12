//If the player is to the left of the ladybug, it will accelerate to the left with its speed
//increasing up to 12 over double the player's own speed
//This is repeated for each direction depending on the player's location relative to the ladybug, so it 
//will have to accelerate and adjust its speed and direction so it's possible to avoid, but still a threat

switch(bugState)
{
	case 1: //Recoil (this shouldn't be 0)
		x += (-cos(recoilAngle * (pi / 180)) * recoilSpeed);
		y += (-sin(recoilAngle * (pi / 180)) * recoilSpeed);
		break;
	
	case 0: //Attack player (this should be 0)
		if (((x - obj_player.x) > 0) && (xSpeed < 13))
		{
			xSpeed -= 0.1;
		}
		else if (((x - obj_player.x) < 0) && (xSpeed < 13))
		{
			xSpeed += 0.1;
		}

		if (((y - obj_player.y) > 0) && (ySpeed < 13))
		{
			ySpeed -= 0.1;
		}
		else if (((y - obj_player.y) < 0) && (ySpeed < 13))
		{
			ySpeed += 0.1;
		}
				
		x += xSpeed;
		y += ySpeed;
		break;
	
	default:
		show_debug_message("something went wrong"); //Shouldn't happen
		break;
}

with (obj_wall)
				{
					if (place_meeting(x, y, enemyLadybug_obj))
					{
						switch(wallType)
										{
											case 3: //Right
												if (enemyLadybug_obj.xSpeed > 0)
												{
													enemyLadybug_obj.xSpeed = 0;
												}
												break;
							
											case 2: //Down
												if (enemyLadybug_obj.ySpeed > 0)
												{
													enemyLadybug_obj.ySpeed = 0;
												}
												break;
						
											case 1: //Left
												if (enemyLadybug_obj.xSpeed < 0)
												{
													enemyLadybug_obj.xSpeed = 0;
												}
												break;
						
											case 0: //Top
												if (enemyLadybug_obj.ySpeed < 0)
												{
													enemyLadybug_obj.ySpeed = 0;
												}
												break;
						
											default: //Shouldn't happen
												show_debug_message("Something went wrong");
												break;
										}
					}
				}
				
if (!audio_is_playing(ladybug_mp3))
{
	audio_play_sound(ladybug_mp3, 7, true);
}