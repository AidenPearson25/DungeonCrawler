// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function takeDamage(damage, healthPool)
{
	//Simple for now, but we can make this show damage text and stuff.
	//I made it a script so we can change how all enemies handle damage easily.
	healthPool -= damage;
	return healthPool;
}