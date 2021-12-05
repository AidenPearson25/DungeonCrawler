/// @description Roll Timer
// You can write your code in this editor

alarm_set(1, rollEndLag);
xSpeed = ((xRollDirection * rollSpeed) / 3);
ySpeed = ((yRollDirection * rollSpeed) / 3);
rollInvincibility = false;