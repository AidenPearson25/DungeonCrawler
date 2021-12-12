randomize();
image_yscale = 0.5;
image_speed = 0.5;
speed = 0;
slimeHealth = 1; //amount of health
speedx = random_range(1,2);
slimeState = 0; //Much like player state.

recoilSpeed = 2;
recoilAngle = 0;

slimeColor = 0;
slimeAttack = 1;

function ChangeColor()
{
	switch (slimeColor)
	{
		case 7: //Red
			image_blend = c_red;
			break;
		
		case 5: //Blue
			image_blend = c_blue;
			break;
		
		case 3: //Yellow
			image_blend = c_yellow;
			break;
		
		case 1: //Red again
			image_blend = c_red;
			break;
		
		default:
	}
}