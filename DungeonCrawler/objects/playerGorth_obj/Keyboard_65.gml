if (noMovement == false) {
	speed = 5;
}

if ((keyboard_check(ord("W"))) && (noMovement == false)) {
	direction = 135;
} else if ((keyboard_check(ord("S"))) && (noMovement == false)) {
	direction = 225;
} else if (noMovement == false) {
	direction = 180;
}