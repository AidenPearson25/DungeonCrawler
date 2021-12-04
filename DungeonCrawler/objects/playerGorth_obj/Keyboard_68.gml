if (noMovement == false) {
	speed = 5;
}

if ((keyboard_check(ord("W"))) && (noMovement == false)) {
	direction = 45;
} else if ((keyboard_check(ord("S"))) && (noMovement == false)) {
	direction = 315;
} else if (noMovement == false) {
	direction = 0;
}