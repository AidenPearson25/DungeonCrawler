/// @description Insert description here
// You can write your code in this editor
if(slimeState = 1)
{
	exit; //don't take damage if you're already hit.	
}
slimeHealth = takeDamage(obj_sword.weaponAttack, slimeHealth); //A script for this in case we want to update a healthbar or something.
alarm_set(0, 15); //Recoil for this many frames.
slimeState = 1;
