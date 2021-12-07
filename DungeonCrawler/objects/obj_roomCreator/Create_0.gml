/// @description Insert description here
// You can write your code in this editor

camera_set_view_pos(view_camera[0], 620, 260);

//TEST
var leftRoomTop = instance_create_layer(626, 298, "room_controllers", obj_wall);
leftRoomTop.wallType = 0; //Top
leftRoomTop.wallLength = (18 * 16);
leftRoomTop.image_xscale = leftRoomTop.wallLength;

var leftRoomLeft = instance_create_layer(626, 298, "room_controllers", obj_wall);
leftRoomLeft.wallType = 1;
leftRoomLeft.wallLength = (15 * 16);
leftRoomLeft.image_yscale = leftRoomLeft.wallLength;

var leftRoomBottom = instance_create_layer(626, 538, "room_controllers", obj_wall);
leftRoomBottom.wallType = 2;
leftRoomBottom.wallLength = (18 * 16);
leftRoomBottom.image_xscale = leftRoomBottom.wallLength;

var leftRoomRight = instance_create_layer(914, 298, "room_controllers", obj_wall);
leftRoomRight.wallType = 3;
leftRoomRight.wallLength = (15 * 16);
leftRoomRight.image_yscale = leftRoomRight.wallLength;