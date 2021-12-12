/// @description Insert description here
// You can write your code in this editor
if(bugState == 1)
{
	exit; //don't take damage if you're already hit.	
}
bugHealth = takeDamage(obj_sword.weaponAttack, bugHealth); //A script for this in case we want to update a healthbar or something.
alarm_set(0, 15); //Recoil for this many frames.
bugState = 1;

recoilAngle = (arctan2(obj_player.y - y, obj_player.x - x) * (180 / pi));

while (recoilAngle < 0)
{
	recoilAngle += 360;
}

while (recoilAngle > 360)
{
	recoilAngle -= 360;
}