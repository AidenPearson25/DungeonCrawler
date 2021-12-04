

//For now, if no keys are being held down, the player will not move
if (keyboard_check(vk_nokey)) {
	speed = 0;
}

if (healthValue == 0) {
	instance_destroy();
}

if (hit == true) {
	playerRecoil = 20
	hit = false;
}

if ((playerRecoil > 0) && (playerRecoil <= 20)){
	invincibleActivate = true;
	noMovement = true;
	playerRecoil -= 1;
	direction = enemySlime_obj.currentDirection;
	speed = recoilSpeed;
} else if (playerRecoil <= 0) {
	playerRecoil -= 0;
	noMovement = false;
	startTimer = true;
	playerRecoil = 25;
} else if (playerRecoil > 20) {
	noMovement = false;
}

if (startTimer = true) {
	alarm_set(0, 30)
	startTimer = false;
}