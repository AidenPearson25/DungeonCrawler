/// @description Insert description here
// You can write your code in this editor
//Making the sword move with the player
x += obj_player.xSpeed
y += obj_player.ySpeed

if (obj_player.xAttackDirection > 0)
{
	if (obj_player.yAttackDirection > 0)
	{
		direction = 45;
	}
	else if (obj_player.yAttackDirection < 0)
	{
		direction = 315;
	}
	else
	{
		direction = 0;
	}
}
else if (obj_player.xAttackDirection < 0)
{
	if (obj_player.yAttackDirection > 0)
	{
		direction = 135;
	}
	else if (obj_player.yAttackDirection < 0)
	{
		direction = 225;
	}
	else
	{
		direction = 180;
	}
}

if (obj_player.yAttackDirection > 0)
{
	if (obj_player.xAttackDirection > 0)
	{
		direction = 315;
	}
	else if (obj_player.xAttackDirection < 0)
	{
		direction = 225;
	}
	else
	{
		direction = 270;
	}
}
else if (obj_player.yAttackDirection < 0)
{
	if (obj_player.xAttackDirection > 0)
	{
		direction = 45;
	}
	else if (obj_player.xAttackDirection < 0)
	{
		direction = 135;
	}
	else
	{
		direction = 90;
	}
}

image_angle = direction;