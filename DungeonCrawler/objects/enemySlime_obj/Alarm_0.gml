/// @description Stop recoiling, maybe die
// You can write your code in this editor
slimeState = 0; //Return to idling.
if(slimeHealth <= 0) //Check if you need to die.
{
	instance_destroy();
	
	var slimeOne = instance_create_layer(x + irandom_range(5, 10), y + irandom_range(5, 10), "objects", enemyMiniSlime_obj);
	slimeOne.slimeColor = slimeColor - 1;
	slimeOne.ChangeColor();
	
	var slimeTwo = instance_create_layer(x + irandom_range(5, 10), y + irandom_range(5, 10), "objects", enemyMiniSlime_obj);
	slimeTwo.slimeColor = slimeColor + 1;
	slimeTwo.ChangeColor();
}