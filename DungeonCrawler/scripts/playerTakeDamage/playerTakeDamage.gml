// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerTakeDamage(enemyAttack, enemy)
{
	if(obj_player.invincibility) //if the player shouldn't be taking damage, don't take damage.
	{
		return;
	}
	obj_player.playerHealth -= enemyAttack; //Take the necessary amount of damage
	obj_player.currentState = 4; //Enter recoil state

	obj_player.recoilAngle = (arctan2(enemy.y - obj_player.y, enemy.x - obj_player.x) * (180 / pi));

	while (obj_player.recoilAngle < 0)
	{
		obj_player.recoilAngle += 360;
	}

	while (obj_player.recoilAngle > 360)
	{
		obj_player.recoilAngle -= 360;
	}
	show_debug_message(obj_player.playerHealth);
	return;
}