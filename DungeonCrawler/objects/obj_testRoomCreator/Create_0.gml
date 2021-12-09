/// @description Set up other rooms
// You can write your code in this editor

randomize();

roomCount = irandom_range(10, 15);
minRoomSize = 8;
maxRoomSize = 20;
tileGrid = [];
failed = false;

for (var i = 0; i < 100; i++)
{
	for (var j = 0; j < 100; j++)
	{
		tileGrid[i, j] = false;
	}
}

function RoomCheck(_current)
{
	failed = false;
	
	for (var i = _current.leftPos[0]; i < (_current.leftPos[0] + _current.leftSize[0]); i++)
	{
		for (var j = _current.leftPos[1]; j < (_current.leftPos[1] + _current.leftSize[1]); j++)
		{
			if (tileGrid[i, j] == true)
			{
				failed = true;
			}
		}
	}
	
	if (failed)
	{
		_current.leftPos = [irandom_range(0, 80), irandom_range(0, 80)]; //Setting start coords
		_current.leftSize = [irandom_range(minRoomSize, maxRoomSize), irandom_range(minRoomSize, maxRoomSize)]; //Setting room size (Static)
		RoomCheck(_current);
	}
	
	else
	{
		RoomWorks(_current);
	}
}

function RoomWorks(_current)
{
	failed = false;
	for (var i = _current.leftPos[0]; i < (_current.leftPos[0] + _current.leftSize[0]); i++)
	{
		for (var j = _current.leftPos[1]; j < (_current.leftPos[1] + _current.leftSize[1]); j++)
		{
			tileGrid[i, j] = true;
		}
	}
	
	DrawRoom(_current);
}

//Make boss room
var currentRoom = instance_create_layer(0, 0, "roomControllers", obj_roomData); //Create draw room object
currentRoom.leftPos = [irandom_range(0, 80), irandom_range(0, 80)]; //Setting start coords
currentRoom.leftSize = [maxRoomSize, maxRoomSize]; //Setting room size (Static)
RoomCheck(currentRoom);

//Make shop
var currentRoom = instance_create_layer(0, 0, "roomControllers", obj_roomData);
currentRoom.leftPos = [irandom_range(0, 80), irandom_range(0, 80)]; //Setting start coords
currentRoom.leftSize = [minRoomSize, minRoomSize]; //Setting room size (Static)
RoomCheck(currentRoom);

for (var i = 2; i < roomCount; i++)
{
	var currentRoom = instance_create_layer(0, 0, "roomControllers", obj_roomData);
	currentRoom.leftPos = [irandom_range(0, 80), irandom_range(0, 80)]; //Setting start coords
	currentRoom.leftSize = [irandom_range(minRoomSize, maxRoomSize), irandom_range(minRoomSize, maxRoomSize)]; //Setting room size (Static)
	RoomCheck(currentRoom);
}