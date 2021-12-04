speed = 5;

if (keyboard_check(ord("W"))) {
	direction = 45;
} else if (keyboard_check(ord("S"))) {
	direction = 315;
} else {
	direction = 0;
}