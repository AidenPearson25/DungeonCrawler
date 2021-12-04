if (noMovement == false) {
	speed = 5;
}

//This checks if another key is being held down and adjusts direction accordingly
//I do the same for all the other keys, but with different directions, and using the accurate keys
if ((keyboard_check(vk_up)) && (noMovement == false)) {
	direction = 135;
} else if ((keyboard_check(vk_down)) && (noMovement == false)) {
	direction = 225;
} else if (noMovement == false) {
	direction = 180;
}