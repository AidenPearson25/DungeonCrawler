/// @description Insert description here
// You can write your code in this editor
if(bugState == 1)
{
	exit; //Don't deal damage if you're busy taking damage.
}
playerTakeDamage(bugAttack, self); //Deal your damage to the player.