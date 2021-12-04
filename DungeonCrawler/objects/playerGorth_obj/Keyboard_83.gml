if (noMovement == false) {
	speed = 5;
}

if ((keyboard_check(ord("A"))) && (noMovement == false)) {
	direction = 225;
} else if ((keyboard_check(ord("D"))) && (noMovement == false)) {
	direction = 315;
} else if (noMovement == false) {
	direction = 270;
}