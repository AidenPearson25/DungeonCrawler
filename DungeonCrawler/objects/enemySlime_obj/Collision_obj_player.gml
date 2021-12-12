/// @description Insert description here
// You can write your code in this editor
if(slimeState == 1)
{
	exit; //Don't deal damage if you're busy taking damage.
}
playerTakeDamage(slimeAttack, self); //Deal your damage to the player.
