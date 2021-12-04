speed = 5;

if (keyboard_check(ord("W"))) {
	direction = 135;
} else if (keyboard_check(ord("S"))) {
	direction = 225;
} else {
	direction = 180;
}