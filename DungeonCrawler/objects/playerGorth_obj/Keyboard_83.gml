speed = 5;

if (keyboard_check(ord("A"))) {
	direction = 225;
} else if (keyboard_check(ord("D"))) {
	direction = 315;
} else {
	direction = 270;
}