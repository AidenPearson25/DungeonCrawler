if (noMovement == false) {
	speed = 5;
}

if ((keyboard_check(vk_up)) && (noMovement == false)) {
	direction = 45;
} else if ((keyboard_check(vk_down)) && (noMovement == false)) {
	direction = 315;
} else if (noMovement == false) {
	direction = 0;
}