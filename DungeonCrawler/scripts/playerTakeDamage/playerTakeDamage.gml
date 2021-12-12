// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerTakeDamage(enemyAttack)
{
	if(obj_player.invincibility) //if the player shouldn't be taking damage, don't take damage.
	{
		return;
	}
	obj_player.playerHealth -= enemyAttack; //Take the necessary amount of damage
	obj_player.currentState = 4; //Enter recoil state
	
	obj_player.alarm_set(4, obj_player.recoilTime); //Set the recoil alarm

	obj_player.recoilAngle = (arctan2(obj_player.y - y, obj_player.x - x) * (180 / pi));

	while (obj_player.recoilAngle < 0)
	{
		obj_player.recoilAngle += 360;
	}

	while (obj_player.recoilAngle > 360)
	{
		obj_player.recoilAngle -= 360;
	}
	return;
}