
//For now, if no keys are being held down, the player will not move
if (keyboard_check(vk_nokey)) {
	speed = 0;
}

if (healthValue == 0) {
	instance_destroy();
}