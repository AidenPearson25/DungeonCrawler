//The slime will move towards the player at all times, for now
//Will need to be changed so it only goes after the player if they're in the same room
//Slightly faster than the player so there's a chance for the slime to hit the player, as well as
//be within range of the player's melee attacks for a small bit of time
//The same goes for the mini slimes
if (playerGorth_obj.healthValue > 0) {
	move_towards_point(playerGorth_obj.x, playerGorth_obj.y, 5.5)
}