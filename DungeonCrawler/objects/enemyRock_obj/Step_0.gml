if ((place_meeting(x, y, obj_player)) && (obj_player.rollInvincibility == false) && (obj_player.gameOver == false))
{
	playerTakeDamage(rockAttack, self); //Deal your damage to the player.
	instance_destroy();
}

with (obj_wall)
		{
			if (place_meeting(x, y, enemyRock_obj))
			{
				instance_destroy();
			}
		}