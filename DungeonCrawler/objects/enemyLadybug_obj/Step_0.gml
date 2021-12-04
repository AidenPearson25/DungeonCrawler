//If the player is to the left of the ladybug, it will accelerate to the left with its speed
//increasing up to 12 over double the player's own speed
//This is repeated for each direction depending on the player's location relative to the ladybug, so it 
//will have to accelerate and adjust its speed and direction so it's possible to avoid, but still a threat
if ((x - playerGorth_obj.x) > 0) && (speed < 13) {
	motion_add(180, 0.125);
} else if ((x - playerGorth_obj.x) < 0) && (speed < 13) {
	motion_add(0, 0.125);
}

if ((y - playerGorth_obj.y) > 0) && (speed < 13) {
	motion_add(90, 0.125);
} else if ((y - playerGorth_obj.y) < 0) && (speed < 13) {
	motion_add(270, 0.125);
}