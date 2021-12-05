
switch(currentState) //Controlling Everything
{
	case 3: //Defending
		
		break; //Done with defending
	
	case 2: //Rolling
		x += xSpeed; //Add to x
		y += ySpeed; //Add to y
		break; //Done with rolling
	
	case 1: //Attacking
		
		break; //Done with attacking
	
	case 0: //Movement
		//Controlling Movement
		if (keyboard_check(ord(upKey)) && !keyboard_check(ord(downKey))) //Holding just up
		{
			yInput = -1; //yInput Up
			lastDirection = 0; //Up
		}

		if (!keyboard_check(ord(upKey)) && keyboard_check(ord(downKey))) //Holding just down
		{
			yInput = 1; //yInput Down
			lastDirection = 2; //Down
		}

		if ((!keyboard_check(ord(upKey)) && !keyboard_check(ord(downKey))) || (keyboard_check(ord(upKey)) && keyboard_check(ord(downKey)))) //Neither or both
		{
			yInput = 0;
		}
		
		if (keyboard_check(ord(leftKey)) && !keyboard_check(ord(rightKey))) //Pressing just Left
		{
			xInput = -1; //xInput Left
			lastDirection = 1; //Left
		}

		if (!keyboard_check(ord(leftKey)) && keyboard_check(ord(rightKey))) //Pressing just right
		{
			xInput = 1; //xInput Right
			lastDirection = 3; //Right
		}

		if ((!keyboard_check(ord(leftKey)) && !keyboard_check(ord(rightKey))) || (keyboard_check(ord(leftKey)) && keyboard_check(ord(rightKey)))) //Neither or both
		{
			xInput = 0; //xInput 0
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

		x += xSpeed; //Add to x
		y += ySpeed; //Add to y

		//Start attack
		if (keyboard_check_pressed(ord(attackKey))) //Check if attack key is pressed
		{
			
		}

		//Start a roll
		if (keyboard_check_pressed(ord(rollKey))) //Check if roll key is pressed
		{
			currentState = 2; //Rolling state
			rollInvincibility = true;
			alarm_set(0, rollDuration);
			
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