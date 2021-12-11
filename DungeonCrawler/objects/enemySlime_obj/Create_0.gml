
slimeColor = irandom_range(1, 3);

switch (slimeColor)
{
	case 3: //Purple
		slimeColor = 6;
		image_blend = c_purple;
		break;
		
	case 2: //Green
		slimeColor = 4;
		image_blend = c_green;
		break;
		
	case 1: //Orange
		slimeColor = 2;
		image_blend = c_orange;
		break;
		
	default:
		break;
}
image_speed = 0.5;
slimeHealth = 2;
slimeState = 0; //Much like player state.
bounceMin = 10; //Minimum time between bounces
bounceMax = 60; //Maximum time between bounces
bounceTime = 15; //The amount of time the slime bounces for.
alarm_set(1, irandom_range(bounceMin, bounceMax)); //Prepare the bounce loop
speedx = random_range(1,2); //Set speed

//Targeting
aimX = 0; //store the player's x, allowing them to kite the slime
aimY = 0;