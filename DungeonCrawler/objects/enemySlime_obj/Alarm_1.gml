/// @description Bounce
// You can write your code in this editor
if(slimeState != 2)
{
	aimX = obj_player.x; //Set the target x to the player's x once. This allows the player to dodge.
	aimY = obj_player.y;

	slimeState = 2; //Update slime state
	alarm_set(1, bounceTime); //Set an alarm to cover a distance.
}
else
{
	slimeState = 0; //return to idling, the bounce has finished.
	alarm_set(1, irandom_range(bounceMin, bounceMax));
}