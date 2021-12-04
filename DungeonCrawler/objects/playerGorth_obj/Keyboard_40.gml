speed = 5;

if (keyboard_check(vk_left)) {
	direction = 225;
} else if (keyboard_check(vk_right)) {
	direction = 315;
} else {
	direction = 270;
}