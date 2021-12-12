/// @description Insert description here
// You can write your code in this editor
if (state = monkey_state.jumping)
{
	exit; //don't take damage if jumping or already hit
}
monkeyHealth = takeDamage(obj_sword.weaponAttack, monkeyHealth); //A script for this in case we want to update a healthbar or something.
alarm_set(1, 15); //Recoil for this many frames.
state = monkey_state.jumping;