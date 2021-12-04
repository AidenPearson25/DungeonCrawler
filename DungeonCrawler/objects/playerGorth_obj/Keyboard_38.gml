speed = 5;

if (keyboard_check(vk_left)) {
	direction = 135;
} else if (keyboard_check(vk_right)) {
	direction = 45;
} else {
	direction = 90;
}