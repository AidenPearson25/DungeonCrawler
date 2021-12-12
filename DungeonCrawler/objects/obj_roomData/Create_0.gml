/// @description Insert description here
// You can write your code in this editor

leftPos = [0, 0]; //Set top left position of left room
leftSize = [0, 0]; //Set size of left room

hasRight = false; //Determine if complex shape
rightPos = [0, 0]; //Set top left position of right room
rightSize = [0, 0]; //Set size of right room

target = self;
extraTarget1 = self;
extraTarget2 = self;
extraAmount = 0;
firstHall = false;

function DrawExtraHallways(_currentRun)
{
	switch (_currentRun)
	{
		case 0:
			if (target == self)
			{
				extraAmount = irandom_range(1, 3);
			}
			
			else
			{
				extraAmount = irandom_range(0, 2);
			}
			
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
						show_debug_message(x);
						if (roomCheck.id != id && extraTarget1 == self)
						{
							extraTarget1 = roomCheck;
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
						if (roomCheck.id != id && extraTarget1 == self)
						{
							extraTarget1 = roomCheck;
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
						if (roomCheck.id != id && extraTarget1 == self)
						{
							extraTarget1 = roomCheck;
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
						if (roomCheck.id != id && extraTarget1 == self)
						{
							extraTarget1 = roomCheck;
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
			if (extraTarget1 == self)
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
						if (roomCheck.id != id && extraTarget2 == self)
						{
							extraTarget2 = roomCheck;
							break;
						}
					}
					break;
				
				case 3: //Left
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x - (100 * i), y, obj_roomData); //Up
						if (roomCheck.id != id && extraTarget2 == self)
						{
							extraTarget2 = roomCheck;
							break;
						}
					}
					break;
				
				case 2: //Down
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x, y + (100 * i), obj_roomData); //Up
						if (roomCheck.id != id && extraTarget2 == self)
						{
							extraTarget2 = roomCheck;
							break;
						}
					}
					break;
				
				case 1: //Right
					for (var i = 0; i < 16; ++i)
					{
						var roomCheck = instance_nearest(x + (100 * i), y, obj_roomData); //Up
						if (roomCheck.id != id && extraTarget2 == self)
						{
							extraTarget2 = roomCheck;
							break;
						}
					}
					break;
				
				default:
					show_debug_message("Something went wrong");
					break;
			}
			if (extraTarget2 == self)
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

function XTileSet(_current)
{
	var ground = layer_tilemap_get_id("ti_ground"); //Set ground tilemap name
	//var deco = layer_tilemap_get_id("ti_deco"); //Set deco tilemap name
	var wall = layer_tilemap_get_id("ti_walls"); //Set wall tilemap name
	
	if (x - _current.x > 0)
	{
		var xDirection = -1;
	}
	
	else
	{
		var xDirection = 1;
	}
	
	for (var i = 0; i < (abs(x - _current.x) / 16); i++)
	{
		if (tilemap_get_at_pixel(wall, x + (i * 16 * xDirection), (y + _current.y) / 2) == 10) //Treetops
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
			}
			
			tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (16));
			tilemap_set_at_pixel(ground, 3, x + (i * 16 * xDirection), ((y + _current.y) / 2) - (16));
		}
		
		if (tilemap_get_at_pixel(wall, x + (i * 16 * xDirection), (y + _current.y) / 2) == 19) //Left Wall
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
				//tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
			}
			
			//tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (16));
			//tilemap_set_at_pixel(wall, 3, x + (i * 16 * xDirection), ((y + _current.y) / 2) - (16));
		}
		
		if (tilemap_get_at_pixel(wall, x + (i * 16 * xDirection), (y + _current.y) / 2) == 26) //Right Wall
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
				//tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
			}
			
			//tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (16));
			//tilemap_set_at_pixel(wall, 3, x + (i * 16 * xDirection), ((y + _current.y) / 2) - (16));
		}
	}
}

function YTileSet(_current)
{
	var ground = layer_tilemap_get_id("ti_ground"); //Set ground tilemap name
	//var deco = layer_tilemap_get_id("ti_deco"); //Set deco tilemap name
	var wall = layer_tilemap_get_id("ti_walls"); //Set wall tilemap name
	
	if (y - _current.y > 0)
	{
		var yDirection = -1;
	}
		
	else
	{
		var yDirection = 1;
	}
		
	for (var i = 0; i < (abs(y - _current.y) / 16); i++)
	{
		if (tilemap_get_at_pixel(wall, (x + _current.x) / 2, y + (i * 16 * yDirection)) == 10) //Treetops
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, ((x + _current.x) / 2) + (j * 16), y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((x + _current.x) / 2) + (j * 16), y + (i * 16 * yDirection));
			}
			tilemap_set_at_pixel(wall, 19, ((x + _current.x) / 2) - (16), y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 26, ((x + _current.x) / 2) + (16), y + (i * 16 * yDirection));
		}
		
		if (tilemap_get_at_pixel(wall, (x + _current.x) / 2, y + (i * 16 * yDirection)) == 4) //Bottom Wall
		{
			for (var j = -1; j < 2; j++) //11 18
			{
				tilemap_set_at_pixel(wall, 0, ((x + _current.x) / 2) + (j * 16), y + (i * 16 * yDirection));
				//tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((x + _current.x) / 2) + (j * 16), y + (i * 16 * yDirection));
			}
			
			tilemap_set_at_pixel(wall, 11, ((x + _current.x) / 2) - (16), y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 18, ((x + _current.x) / 2) + (16), y + (i * 16 * yDirection));
		}
		
		if (tilemap_get_at_pixel(ground, (x + _current.x) / 2, y + (i * 16 * yDirection)) == 3) //Top Wall
		{
			for (var j = -1; j < 2; j++) //17 24
			{
				tilemap_set_at_pixel(wall, 0, ((x + _current.x) / 2) + (j * 16), y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((x + _current.x) / 2) + (j * 16), y + (i * 16 * yDirection));
			}
			
			tilemap_set_at_pixel(wall, 17, ((x + _current.x) / 2) - (16), y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 24, ((x + _current.x) / 2) + (16), y + (i * 16 * yDirection));
		}
	}
}

function CornerXTileSet(_current, anglePointX, anglePointY)
{
	var ground = layer_tilemap_get_id("ti_ground"); //Set ground tilemap name
	//var deco = layer_tilemap_get_id("ti_deco"); //Set deco tilemap name
	var wall = layer_tilemap_get_id("ti_walls"); //Set wall tilemap name
	
	if (x - anglePointX > 0)
	{
		var xDirection = -1;
	}
	
	else
	{
		var xDirection = 1;
	}
	
	for (var i = -1; i < (abs(x - anglePointX + 1) / 16); i++)
	{
		if (tilemap_get_at_pixel(wall, x + (i * 16 * xDirection), (y + anglePointY) / 2) == 10) //Treetops
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, x + (i * 16 * xDirection), ((y + anglePointY) / 2) + (j * 16));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), x + (i * 16 * xDirection), ((y + anglePointY) / 2) + (j * 16));
			}
			
			tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + anglePointY) / 2) + (16));
			tilemap_set_at_pixel(ground, 3, x + (i * 16 * xDirection), ((y + anglePointY) / 2) - (16));
		}
		
		if (tilemap_get_at_pixel(wall, x + (i * 16 * xDirection), (y + anglePointY) / 2) == 19) //Left Wall
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, x + (i * 16 * xDirection), ((y + anglePointY) / 2) + (j * 16));
				//tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
			}
			
			//tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (16));
			//tilemap_set_at_pixel(wall, 3, x + (i * 16 * xDirection), ((y + _current.y) / 2) - (16));
		}
		
		if (tilemap_get_at_pixel(wall, x + (i * 16 * xDirection), (y + anglePointY) / 2) == 26) //Right Wall
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, x + (i * 16 * xDirection), ((y + anglePointY) / 2) + (j * 16));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), x + (i * 16 * xDirection), ((y + anglePointY) / 2) + (j * 16));
			}
			
			//tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (16));
			//tilemap_set_at_pixel(wall, 3, x + (i * 16 * xDirection), ((y + _current.y) / 2) - (16));
		}
	}

	if (_current.x - anglePointX > 0)
	{
		var xDirection = -1;
	}
	
	else
	{
		var xDirection = 1;
	}
	
	for (var i = -1; i < (abs(_current.x - anglePointX + 1) / 16); i++)
	{
		if (tilemap_get_at_pixel(wall, _current.x + (i * 16 * xDirection), (_current.y + anglePointY) / 2) == 10) //Treetops
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, _current.x + (i * 16 * xDirection), ((_current.y + anglePointY) / 2) + (j * 16));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), _current.x + (i * 16 * xDirection), ((_current.y + anglePointY) / 2) + (j * 16));
			}
			
			tilemap_set_at_pixel(wall, 4, _current.x + (i * 16 * xDirection), ((_current.y + anglePointY) / 2) + (16));
			tilemap_set_at_pixel(ground, 3, _current.x + (i * 16 * xDirection), ((_current.y + anglePointY) / 2) - (16));
		}
		
		if (tilemap_get_at_pixel(wall, _current.x + (i * 16 * xDirection), (_current.y + anglePointY) / 2) == 19) //Left Wall
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, _current.x + (i * 16 * xDirection), ((_current.y + anglePointY) / 2) + (j * 16));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), _current.x + (i * 16 * xDirection), ((_current.y + anglePointY) / 2) + (j * 16));
			}
			
			//tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (16));
			//tilemap_set_at_pixel(wall, 3, x + (i * 16 * xDirection), ((y + _current.y) / 2) - (16));
		}
		
		if (tilemap_get_at_pixel(wall, _current.x + (i * 16 * xDirection), (_current.y + anglePointY) / 2) == 26) //Right Wall
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, _current.x + (i * 16 * xDirection), ((_current.y + anglePointY) / 2) + (j * 16));
				//tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), x + (i * 16 * xDirection), ((y + _current.y) / 2) + (j * 16));
			}
			
			//tilemap_set_at_pixel(wall, 4, x + (i * 16 * xDirection), ((y + _current.y) / 2) + (16));
			//tilemap_set_at_pixel(wall, 3, x + (i * 16 * xDirection), ((y + _current.y) / 2) - (16));
		}
	}
}

function CornerYTileSet(_current, anglePointX, anglePointY)
{
	var ground = layer_tilemap_get_id("ti_ground"); //Set ground tilemap name
	//var deco = layer_tilemap_get_id("ti_deco"); //Set deco tilemap name
	var wall = layer_tilemap_get_id("ti_walls"); //Set wall tilemap name
	
	if (y - anglePointY > 0)
	{
		var yDirection = -1;
	}
		
	else
	{
		var yDirection = 1;
	}
		
	for (var i = -1; i < (abs(y - anglePointY + 1) / 16); i++)
	{
		if (tilemap_get_at_pixel(wall, (x + anglePointX) / 2, y + (i * 16 * yDirection)) == 10) //Treetops
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, ((x + anglePointX) / 2) + (j * 16), y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((x + anglePointX) / 2) + (j * 16), y + (i * 16 * yDirection));
			}
			tilemap_set_at_pixel(wall, 19, ((x + anglePointX) / 2) - (16), y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 26, ((x + anglePointX) / 2) + (16), y + (i * 16 * yDirection));
		}
		
		if (tilemap_get_at_pixel(wall, (x + anglePointX) / 2, y + (i * 16 * yDirection)) == 4) //Bottom Wall
		{
			for (var j = -1; j < 2; j++) //11 18
			{
				tilemap_set_at_pixel(wall, 0, ((x + anglePointX) / 2) + (j * 16), y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((x + anglePointX) / 2) + (j * 16), y + (i * 16 * yDirection));
			}
			
			tilemap_set_at_pixel(wall, 11, ((x + anglePointX) / 2) - (16), y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 18, ((x + anglePointX) / 2) + (16), y + (i * 16 * yDirection));
		}
		
		if (tilemap_get_at_pixel(ground, (x + anglePointX) / 2, y + (i * 16 * yDirection)) == 3) //Top Wall
		{
			for (var j = -1; j < 2; j++) //17 24
			{
				tilemap_set_at_pixel(wall, 0, ((x + anglePointX) / 2) + (j * 16), y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((x + anglePointX) / 2) + (j * 16), y + (i * 16 * yDirection));
			}
			
			tilemap_set_at_pixel(wall, 17, ((x + anglePointX) / 2) - (16), y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 24, ((x + anglePointX) / 2) + (16), y + (i * 16 * yDirection));
		}
	}
	
	if (_current.y - anglePointY > 0)
	{
		var yDirection = -1;
	}
		
	else
	{
		var yDirection = 1;
	}
		
	for (var i = -1; i < (abs(_current.y - anglePointY + 1) / 16); i++)
	{
		if (tilemap_get_at_pixel(wall, (_current.x + anglePointX) / 2, _current.y + (i * 16 * yDirection)) == 10) //Treetops
		{
			for (var j = -1; j < 2; j++)
			{
				tilemap_set_at_pixel(wall, 0, ((_current.x + anglePointX) / 2) + (j * 16), _current.y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((_current.x + anglePointX) / 2) + (j * 16), _current.y + (i * 16 * yDirection));
			}
			tilemap_set_at_pixel(wall, 19, ((_current.x + anglePointX) / 2) - (16), _current.y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 26, ((_current.x + anglePointX) / 2) + (16), _current.y + (i * 16 * yDirection));
		}
		
		if (tilemap_get_at_pixel(wall, (_current.x + anglePointX) / 2, _current.y + (i * 16 * yDirection)) == 4) //Bottom Wall
		{
			for (var j = -1; j < 2; j++) //11 18
			{
				tilemap_set_at_pixel(wall, 0, ((_current.x + anglePointX) / 2) + (j * 16), _current.y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((_current.x + anglePointX) / 2) + (j * 16), _current.y + (i * 16 * yDirection));
			}
			
			tilemap_set_at_pixel(wall, 11, ((_current.x + anglePointX) / 2) - (16), _current.y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 18, ((_current.x + anglePointX) / 2) + (16), _current.y + (i * 16 * yDirection));
		}
		
		if (tilemap_get_at_pixel(ground, (_current.x + anglePointX) / 2, _current.y + (i * 16 * yDirection)) == 3) //Top Wall
		{
			for (var j = -1; j < 2; j++) //17 24
			{
				tilemap_set_at_pixel(wall, 0, ((_current.x + anglePointX) / 2) + (j * 16), _current.y + (i * 16 * yDirection));
				tilemap_set_at_pixel(ground, 6 + (7 * irandom_range(0, 3)), ((_current.x + anglePointX) / 2) + (j * 16), _current.y + (i * 16 * yDirection));
			}
			
			tilemap_set_at_pixel(wall, 17, ((_current.x + anglePointX) / 2) - (16), _current.y + (i * 16 * yDirection));
			tilemap_set_at_pixel(wall, 24, ((_current.x + anglePointX) / 2) + (16), _current.y + (i * 16 * yDirection));
		}
	}
}

function DrawTiles(_current)
{
	if ((abs(x - _current.x) < (leftSize[0] * 8)) && (abs(x - _current.x) < (_current.leftSize[0] * 8)))
	{
		//Straight vertical line
		draw_line_width((x + _current.x) / 2, y, (x + _current.x) / 2, _current.y, 10);
		YTileSet(_current);
	}

	else if ((abs(y - _current.y) < (leftSize[1] * 8)) && (abs(y - _current.y) < (_current.leftSize[1] * 8)))
	{
		//Straight horizontal line
		draw_line_width(x, (y + _current.y) / 2, _current.x, (y + _current.y) / 2, 10);
		XTileSet(_current);
	}

	else
	{
		//90degree turn
		var anglePointX = 0;
		var anglePointY = 0;
	
		if (x >= _current.x && y <= _current.y) //BottomRight
		{
			anglePointX = x;
			anglePointY = _current.y;
		}
	
		if (x > _current.x && y > _current.y) //TopRight
		{
			anglePointX = x;
			anglePointY = _current.y;
		}
	
		if (x <= _current.x && y >= _current.y) //TopLeft
		{
			anglePointX = _current.x;
			anglePointY = y;
		}
	
		if (x < _current.x && y < _current.y) //BottomLeft
		{
			anglePointX = _current.x;
			anglePointY = y;
		}
	
		draw_line_width(x, y, anglePointX, anglePointY, 10);
		draw_line_width(_current.x, _current.y, anglePointX, anglePointY, 10);
		
		CornerXTileSet(_current, anglePointX, anglePointY);
		CornerYTileSet(_current, anglePointX, anglePointY);
	}
}