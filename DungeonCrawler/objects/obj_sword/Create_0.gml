/// @description Insert description here
// You can write your code in this editor

xDirection = 0;
yDirection = 0;
weaponDirection = 0;
weaponAttack = 1; //Each weapon having the same variable names would be good I think.
image_speed = 0.72;

function MatchDirection()
{
	switch (xDirection)
	{
		case 1:
			switch (yDirection)
			{
				case 1:
					weaponDirection = 315; //Up right
					break;
				
				case 0:
					weaponDirection = 0; //Right
					break;
				
				case -1:
					weaponDirection = 45; //Down right
					break;
				
				default:
					show_debug_message("Something went wrong");
					break;
			}
			break;
		
		case 0:
			switch (yDirection)
			{
				case 1:
					weaponDirection = 270; //Up
					break;
				
				case 0:
					show_debug_message("Something went REALLY wrong"); //Somehow both zero despite last direction
					break;
				
				case -1:
					weaponDirection = 90; //Down
					break;
				
				default:
					show_debug_message("Something went wrong");
					break;
			}
			break;
		
		case -1:
			switch (yDirection)
			{
				case 1:
					weaponDirection = 225; //Up left
					break;
				
				case 0:
					weaponDirection = 180; //Left
					break;
				
				case -1:
					weaponDirection = 135; //Down left
					break;
				
				default:
					show_debug_message("Something went wrong");
					break;
			}
			break;
		
		default:
			show_debug_message("Something went wrong"); //Shouldn't happen
			break;
	}
	
	image_angle = weaponDirection;
}