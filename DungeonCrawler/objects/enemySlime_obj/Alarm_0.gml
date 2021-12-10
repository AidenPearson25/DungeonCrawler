/// @description Stop recoiling, maybe die
// You can write your code in this editor
slimeState = 0; //Return to idling.
if(slimeHealth <= 0) //Check if you need to die.
{
	instance_destroy();
	for (var i = 0; i < 2; ++i) {
		with instance_create_layer(x,y,"objects",enemyMiniSlime_obj) //Spawn baby slimes.
		{
			x+=irandom_range(5,10);
			y+=irandom_range(5,10);
		}
	}
}