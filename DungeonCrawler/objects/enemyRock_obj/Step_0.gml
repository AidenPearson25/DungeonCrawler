if ((place_meeting(x, y, obj_player)) && (obj_player.rollInvincibility = false))
{
	playerTakeDamage(rockAttack, self); //Deal your damage to the player.
	instance_destroy();
}