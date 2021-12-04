if (noMovement == false) {
	speed = 5;
}

if ((keyboard_check(vk_left)) && (noMovement == false)) {
	direction = 135;
} else if ((keyboard_check(vk_right)) && (noMovement == false)) {
	direction = 45;
} else if (noMovement == false) {
	direction = 90;
}