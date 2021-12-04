if (noMovement == false) {
	speed = 5;
}

if ((keyboard_check(ord("A"))) && (noMovement == false)) {
	direction = 135;
} else if ((keyboard_check(ord("D"))) && (noMovement == false)) {
	direction = 45;
} else if (noMovement == false) {
	direction = 90;
}