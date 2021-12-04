speed = 5;

if (keyboard_check(ord("A"))) {
	direction = 135;
} else if (keyboard_check(ord("D"))) {
	direction = 45;
} else {
	direction = 90;
}