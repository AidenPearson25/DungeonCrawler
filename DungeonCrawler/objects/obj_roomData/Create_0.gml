/// @description Insert description here
// You can write your code in this editor

leftPos = [0, 0]; //Set top left position of left room
leftSize = [0, 0]; //Set size of left room

hasRight = false; //Determine if complex shape
rightPos = [0, 0]; //Set top left position of right room
rightSize = [0, 0]; //Set size of right room

targetX = 0;
targetY = 0;
extraTarget1X = x;
extraTarget1Y = y;
extraTarget2X = x;
extraTarget2Y = y;
extraAmount = 0;
firstHall = false;

function DrawExtraHallways(_currentRun)
{
	switch (_currentRun)
	{
		case 0:
			extraAmount = irandom_range(0, 2);
			extraTarget1X = x;
			extraTarget1Y = y;
			extraTarget2X = x;
			extraTarget2Y = y;
			
			if (extraAmount > 0)
			{
				DrawExtraHallways(1);
				exit;
			}
			break;
			
		case 1:
			var extraDirection = irandom_range(1, 4);
			switch (extraDirection)
			{
				case 4: //Up
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x, y - (100 * i), obj_roomData); //Up
						show_debug_message(extraTarget1X);
						show_debug_message(x);
						if (roomCheck.id != id && extraTarget1X == x && extraTarget1Y == y)
						{
							extraTarget1X = roomCheck.x;
							extraTarget1Y = roomCheck.y;
							if (extraAmount > 1)
							{
								DrawExtraHallways(2);
								exit;
							}
							break;
						}
					}
					break;
				
				case 3: //Left
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x - (100 * i), y, obj_roomData); //Up
						if (roomCheck.id != id && extraTarget1X == x && extraTarget1Y == y)
						{
							extraTarget1X = roomCheck.x;
							extraTarget1Y = roomCheck.y;
							if (extraAmount > 1)
							{
								DrawExtraHallways(2);
								exit;
							}
							break;
						}
					}
					break;
				
				case 2: //Down
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x, y + (100 * i), obj_roomData); //Up
						if (roomCheck.id != id && extraTarget1X == x && extraTarget1Y == y)
						{
							extraTarget1X = roomCheck.x;
							extraTarget1Y = roomCheck.y;
							if (extraAmount > 1)
							{
								DrawExtraHallways(2);
								exit;
							}
							break;
						}
					}
					break;
				
				case 1: //Right
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x + (100 * i), y, obj_roomData); //Up
						if (roomCheck.id != id && extraTarget1X == x && extraTarget1Y == y)
						{
							extraTarget1X = roomCheck.x;
							extraTarget1Y = roomCheck.y;
							if (extraAmount > 1)
							{
								DrawExtraHallways(2);
								exit;
							}
							break;
						}
					}
					break;
				
				default:
					show_debug_message("Something went wrong");
					break;
			}
			if (extraTarget1X == x && extraTarget1Y == y)
			{
				DrawExtraHallways(1);
				exit;
			}
			break;
			
		case 2:
			var extraDirection = irandom_range(1, 4);
			switch (extraDirection)
			{
				case 4: //Up
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x, y - (100 * i), obj_roomData); //Up
						if (roomCheck.id != id && extraTarget2X == x && extraTarget2Y == y)
						{
							extraTarget2X = roomCheck.x;
							extraTarget2Y = roomCheck.y;
							break;
						}
					}
					break;
				
				case 3: //Left
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x - (100 * i), y, obj_roomData); //Up
						if (roomCheck.id != id && extraTarget2X == x && extraTarget2Y == y)
						{
							extraTarget2X = roomCheck.x;
							extraTarget2Y = roomCheck.y;
							break;
						}
					}
					break;
				
				case 2: //Down
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x, y + (100 * i), obj_roomData); //Up
						if (roomCheck.id != id && extraTarget2X == x && extraTarget2Y == y)
						{
							extraTarget2X = roomCheck.x;
							extraTarget2Y = roomCheck.y;
							break;
						}
					}
					break;
				
				case 1: //Right
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x + (100 * i), y, obj_roomData); //Up
						if (roomCheck.id != id && extraTarget2X == x && extraTarget2Y == y)
						{
							extraTarget2X = roomCheck.x;
							extraTarget2Y = roomCheck.y;
							break;
						}
					}
					break;
				
				default:
					show_debug_message("Something went wrong");
					break;
			}
			if (extraTarget2X == x && extraTarget2Y == y)
			{
				DrawExtraHallways(2);
				exit;
			}
			break;
			
		default:
			show_debug_message("Something went wrong");
			break;
	}
}