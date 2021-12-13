/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, obj_player))
{
	if (camera_get_view_target(view_camera[0]) == obj_player && check == false)
	{
		check = true;
		camera_set_view_target(view_camera[0], targetRoom);
	}
	
	if (camera_get_view_target(view_camera[0]).object_index == obj_roomData && check == false)
	{
		check = true;
		camera_set_view_target(view_camera[0], obj_player);
	}
}

if (check == true)
{
	if (!place_meeting(x, y, obj_player))
	{
		check = false;
	}
}
