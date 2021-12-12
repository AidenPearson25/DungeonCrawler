// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawHallways(_current)
{
	for (var i = 0; i < 16; ++i)
	{
		var roomCheck = instance_nearest(_current.x, _current.y - (100 * i), obj_roomData); //Up
		if (roomCheck.id != _current.id && roomCheck.firstHall == false && _current.firstHall == false)
		{
			_current.target = roomCheck;
			_current.firstHall = true;
			DrawHallways(roomCheck);
			exit;
		}
		
		var roomCheck = instance_nearest(_current.x - (100 * i), _current.y, obj_roomData); //Left
		if (roomCheck.id != _current.id && roomCheck.firstHall == false && _current.firstHall == false)
		{
			_current.target = roomCheck;
			_current.firstHall = true;
			DrawHallways(roomCheck);
			exit;
		}
		
		var roomCheck = instance_nearest(_current.x, _current.y + (100 * i), obj_roomData); //Down
		if (roomCheck.id != _current.id && roomCheck.firstHall == false && _current.firstHall == false)
		{
			_current.target = roomCheck;
			_current.firstHall = true;
			DrawHallways(roomCheck);
			exit;
		}
		
		var roomCheck = instance_nearest(_current.x + (100 * i), _current.y, obj_roomData); //Right
		if (roomCheck.id != _current.id && roomCheck.firstHall == false && _current.firstHall == false)
		{
			_current.target = roomCheck;
			_current.firstHall = true;
			DrawHallways(roomCheck);
			exit;
		}
	}
}