speed = 5;

if (keyboard_check(vk_up)) {
	direction = 45;
} else if (keyboard_check(vk_down)) {
	direction = 315;
} else {
	direction = 0;
}