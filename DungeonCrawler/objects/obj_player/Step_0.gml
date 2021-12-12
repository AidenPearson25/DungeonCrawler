
switch(currentState) //Controlling Everything
{
	case 5: //Die
	
		break;
	
	case 4: //Recoil
		if(alarm_get(4) == -1) //If the invincibility alarm hasn't already been set,
		{
			alarm_set(4, recoilTime); //set the invinicibility alarm for recoil.
		}
		with (obj_wall)
		{
			if (place_meeting(x, y, obj_player))
			{
				
						if (obj_player.recoilSpeed > 0)
						{
							obj_player.recoilSpeed = 0;
						}
							
			}
			else
			{
				obj_player.recoilSpeed = 2;
			}
		}
	
		x += (-cos(recoilAngle * (pi / 180)) * recoilSpeed);
		y += (-sin(recoilAngle * (pi / 180)) * recoilSpeed);
		
					default: //Shouldn't happen
						show_debug_message("Something went wrong");
		break;
	
	case 3: //Defending
		
		break; //Done with defending
	
	case 2: //Rolling
		with (obj_wall)
		{
			if (place_meeting(x, y, obj_player))
			{
				switch(wallType)
				{
					case 3: //Right
						if (obj_player.xSpeed > 0)
						{
							obj_player.xAcceleration = 0;
							obj_player.xSpeed = 0;
						}
						break;
							
					case 2: //Down
						if (obj_player.ySpeed > 0)
						{
							obj_player.yAcceleration = 0;
							obj_player.ySpeed = 0;
						}
						break;
						
					case 1: //Left
						if (obj_player.xSpeed < 0)
						{
							obj_player.xAcceleration = 0;
							obj_player.xSpeed = 0;
						}
						break;
						
					case 0: //Top
						if (obj_player.ySpeed < 0)
						{
							obj_player.yAcceleration = 0;
							obj_player.ySpeed = 0;
						}
						break;
						
					default: //Shouldn't happen
						show_debug_message("Something went wrong");
						break;
				}
			}
		}
		
		x += xSpeed; //Add to x
		y += ySpeed; //Add to y
		break; //Done with rolling
	
	case 1: //Attacking
	
	with (obj_wall)
		{
			if (place_meeting(x, y, obj_player))
			{
				switch(wallType)
				{
					case 3: //Right
						if (obj_player.xSpeed > 0)
						{
							obj_player.xAcceleration = 0;
							obj_player.xSpeed = 0;
						}
						break;
							
					case 2: //Down
						if (obj_player.ySpeed > 0)
						{
							obj_player.yAcceleration = 0;
							obj_player.ySpeed = 0;
						}
						break;
						
					case 1: //Left
						if (obj_player.xSpeed < 0)
						{
							obj_player.xAcceleration = 0;
							obj_player.xSpeed = 0;
						}
						break;
						
					case 0: //Top
						if (obj_player.ySpeed < 0)
						{
							obj_player.yAcceleration = 0;
							obj_player.ySpeed = 0;
						}
						break;
						
					default: //Shouldn't happen
						show_debug_message("Something went wrong");
						break;
				}
			}
		}
	
		x += xSpeed; //Add to x
		y += ySpeed; //Add to y
		break; //Done with attacking
	
	case 0: //Movement
		//Controlling Movement
		if (keyboard_check(ord(upKey)) && !keyboard_check(ord(downKey))) //Holding just up
		{
			yInput = -1; //yInput Up
			lastDirection = 0; //Up
			if (xInput == 0)
			{
				sprite_index = spr_playerUp;
				image_speed = 1;
			}
			if (!audio_is_playing(walking_wav))
			{
				audio_play_sound(walking_wav, 4, true);
			}
		}

		if (!keyboard_check(ord(upKey)) && keyboard_check(ord(downKey))) //Holding just down
		{
			yInput = 1; //yInput Down
			lastDirection = 2; //Down
			if (xInput == 0)
			{
				sprite_index = spr_playerDown;
				image_speed = 1;
			}
			if (!audio_is_playing(walking_wav))
			{
				audio_play_sound(walking_wav, 4, true);
			}
		}

		if ((!keyboard_check(ord(upKey)) && !keyboard_check(ord(downKey))) || (keyboard_check(ord(upKey)) && keyboard_check(ord(downKey)))) //Neither or both
		{
			yInput = 0;
		}
		
		if (keyboard_check(ord(leftKey)) && !keyboard_check(ord(rightKey))) //Pressing just Left
		{
			xInput = -1; //xInput Left
			lastDirection = 1; //Left
			if (yInput == 0)
			{
				sprite_index = spr_playerLeft;
				image_speed = 1;
			}
			if (!audio_is_playing(walking_wav))
			{
				audio_play_sound(walking_wav, 4, true);
			}
		}

		if (!keyboard_check(ord(leftKey)) && keyboard_check(ord(rightKey))) //Pressing just right
		{
			xInput = 1; //xInput Right
			lastDirection = 3; //Right
			if (yInput == 0)
			{
				sprite_index = spr_playerRight;
				image_speed = 1;
			}
			if (!audio_is_playing(walking_wav))
			{
				audio_play_sound(walking_wav, 4, true);
			}
		}

		if ((!keyboard_check(ord(leftKey)) && !keyboard_check(ord(rightKey))) || (keyboard_check(ord(leftKey)) && keyboard_check(ord(rightKey)))) //Neither or both
		{
			xInput = 0; //xInput 0
		}
		
		if (xInput == 0 && yInput == 0)
		{
			image_speed = 0;
			image_index = 0;
			audio_stop_sound(walking_wav);
		}

		switch(xInput) //Check xInput to add speed
		{
			case 1: //Right
				if (xAcceleration < xInput) //Check if not yet at full speed
				{
					xAcceleration += 0.1; //Incrementally add accel until full speed
				}
				break;
	
			case 0: //Neutral
				if (xAcceleration > 0) //Check whether accel is too high
				{
					xAcceleration -= 0.1; //Incrementally lose accel until 0
				}
		
				else if (xAcceleration < 0) //Check whether accel is too low
				{
					xAcceleration += 0.1; //Incrementally lose accel until 0
				}
				break;
	
			case -1: //Left
				if (xAcceleration > xInput) //Check if not yet at full speed
				{
					xAcceleration -= 0.1; //Incrementally add accel until full speed
				}
				break;
		
			default:
				show_debug_message("something went wrong"); //Shouldn't happen
				break;
		}

		switch(yInput) //Check yInput to add speed
		{
			case 1: //Right
				if (yAcceleration < yInput) //Check if not yet at full speed
				{
					yAcceleration += 0.1; //Incrementally add accel until full speed
				}
				break;
	
			case 0: //Neutral
				if (yAcceleration > 0) //Check whether accel is too high
				{
					yAcceleration -= 0.1; //Incrementally lose accel until 0
				}
		 
				else if (yAcceleration < 0) //Check whether accel is too low
				{
					yAcceleration += 0.1; //Incrementally lose accel until 0
				}
				break;
	
			case -1: //Left
				if (yAcceleration > yInput) //Check if not yet at full speed
				{
					yAcceleration -= 0.1; //Incrementally add accel until full speed
				}
				break;
		
			default:
				show_debug_message("something went wrong"); //Shouldn't happen
				break;
		}

		xSpeed = (moveSpeed * xAcceleration); //Set xSpeed
		ySpeed = (moveSpeed * yAcceleration); //Set ySpeed

		with (obj_wall)
		{
			if (place_meeting(x, y, obj_player))
			{
				switch(wallType)
				{
					case 3: //Right
						if (obj_player.xAcceleration > 0)
						{
							obj_player.xAcceleration = 0;
							obj_player.xSpeed = 0;
						}
						break;
						
					case 2: //Down
						if (obj_player.yAcceleration > 0)
						{
							obj_player.yAcceleration = 0;
							obj_player.ySpeed = 0;
						}
						break;
						
					case 1: //Left
						if (obj_player.xAcceleration < 0)
						{
							obj_player.xAcceleration = 0;
							obj_player.xSpeed = 0;
						}
						break;
						
					case 0: //Top
						if (obj_player.yAcceleration < 0)
						{
							obj_player.yAcceleration = 0;
							obj_player.ySpeed = 0;
						}
						break;
						
					default: //Shouldn't happen
						show_debug_message("Something went wrong");
						break;
				}
			}
		}

		x += xSpeed; //Add to x
		y += ySpeed; //Add to y

		//Start attack
		if (keyboard_check_pressed(ord(attackKey))) //Check if attack key is pressed
		{
			currentState = 1; //Attacking state
			alarm_set(2, attackDuration);
			
			if (xInput > 0 || xInput < 0) //If moving left or right
			{
				xAttackDirection = xInput; //Making the sword spawn in the player's current x direction
				
				if (yInput == 0)
				{
					yAttackDirection = 0; //Fix condition
				}
				
			}
			
			if (yInput > 0 || yInput < 0) //If moving up or down
			{
				yAttackDirection = yInput; //Making the sword spawn in the player's current y direction
				
				if (xInput == 0)
				{
					xAttackDirection = 0; //Fix condition
				}
			}
			
			if (xInput == 0 && yInput == 0)
			{
				switch(lastDirection)
				{
					case 3: //Right
						xAttackDirection = 1;
						yAttackDirection = 0;
						break;
						
					case 2: //Down
						xAttackDirection = 0;
						yAttackDirection = 1;
						break;
						
					case 1: //Left
						xAttackDirection = -1;
						yAttackDirection = 0;
						break;
						
					case 0: //Up
						xAttackDirection = 0;
						yAttackDirection = -1;
						break;
					
					default:
						show_debug_message("Something went wrong"); //Shouldn't happen
						break;
				}
			}
			
			var weaponObject = instance_create_layer(x, y, "objects", equippedWeapon); //Actually making the sword appear
			weaponObject.xDirection = xAttackDirection;
			weaponObject.yDirection = yAttackDirection;
			weaponObject.MatchDirection();
			
			xSpeed = (moveSpeed * xAttackDirection);
			ySpeed = (moveSpeed * yAttackDirection);
		}


		//Start a roll
		if (keyboard_check_pressed(ord(rollKey))) //Check if roll key is pressed
		{
			currentState = 2; //Rolling state
			rollInvincibility = true;
			alarm_set(0, rollDuration);
			if (!audio_is_playing(rollSound_wav))
			{
				audio_play_sound(rollSound_wav, 3, false);
			}
			
			if (xInput > 0 || xInput < 0) //If moving left or right
			{
				xRollDirection = xInput; //Match xInput
				xAcceleration = xInput; //End roll fast
				
				if (yInput == 0)
				{
					yRollDirection = 0; //Fix condition
					yAcceleration = 0;
				}
			}
			
			if (yInput > 0 || yInput < 0) //If moving up or down
			{
				yRollDirection = yInput; //Match yInput
				yAcceleration = yInput; //End roll fast
				
				if (xInput == 0)
				{
					xRollDirection = 0; //Fix condition
					xAcceleration = 0;
				}
			}
			
			if (xInput == 0 && yInput == 0) //If neither pressed
			{
				switch(lastDirection)
				{
					case 3: //Right
						xRollDirection = 1;
						xAcceleration = 1;
						yRollDirection = 0;
						yAcceleration = 0;
						break;
						
					case 2: //Down
						xRollDirection = 0;
						xAcceleration = 0;
						yRollDirection = 1;
						yAcceleration = 1;
						break;
						
					case 1: //Left
						xRollDirection = -1;
						xAcceleration = -1;
						yRollDirection = 0;
						yAcceleration = 0;
						break;
						
					case 0: //Up
						xRollDirection = 0;
						xAcceleration = 0;
						yRollDirection = -1;
						yAcceleration = -1;
						break;
						
					default:
						show_debug_message("Something went wrong"); //Shouldn't happen
						break;
				}
			}
			
			xSpeed = (rollSpeed * xRollDirection);
			ySpeed = (rollSpeed * yRollDirection);
		}

		//Start defending
		if (keyboard_check_pressed(ord(defendKey))) //Check if defend key is pressed
		{
			
		}
		
		break; //Finally done with movement haha
		
	default:
		show_debug_message("Something went wrong"); //Shouldn't happen
		break;
}

//Determine whether the player is currently invincible
if(iframes || rollInvincibility)
{
	invincibility = true; //If any other invincibility booleans are true, this should be, too.
}
else if(currentState == 4)
{
	invincibility = true; //Avoid unnecessary extra damage
}
else
{
	invincibility = false;	
}

if (gameOver = true) {
	if (audio_is_playing(walking_wav))
	{
		audio_stop_sound(walking_wav);
	}
	gameOverTimer -= 1/60;
}

if (gameOverTimer <= 0) {
	room_goto(gameOverRoom);
}