/// @description Insert description here
// You can write your code in this editor

camera_set_view_pos(view_camera[0], 620, 260);

//TEST
var leftRoomTop = instance_create_layer(626, 303, "room_controllers", obj_wall);
leftRoomTop.wallType = 0; //Top
leftRoomTop.wallLength = (11 * 16);
leftRoomTop.image_xscale = leftRoomTop.wallLength;

var leftRoomLeft = instance_create_layer(626, 303, "room_controllers", obj_wall);
leftRoomLeft.wallType = 1;
leftRoomLeft.wallLength = (7 * 16);
leftRoomLeft.image_yscale = leftRoomLeft.wallLength;

var leftRoomBottom = instance_create_layer(626, 415, "room_controllers", obj_wall);
leftRoomBottom.wallType = 2;
leftRoomBottom.wallLength = (11 * 16);
leftRoomBottom.image_xscale = leftRoomBottom.wallLength;