/// @description Insert description here
// You can write your code in this editor
var posxAll = room_width * 0.5;
var posyTitle = room_height * 0.2;
var lineheightTitle = 0;
var textwidthTitle = room_width * 0.75;

var xsizeTitle = 4;
var ysizeTitle = 4;

var posyPressEnter = room_height * 0.6;
var lineheightPressEnter = 10;
var textwidthPressEnter = room_width * 0.5;

var posyInstructions = room_height * 0.75;
var lineheightInstructions = 25;
var textwidthInstructions = room_width * 0.25;

var xsizeRest = 1;
var ysizeRest = 1;

draw_text_ext_transformed(posxAll, posyTitle, "Tergiverse", lineheightTitle, textwidthTitle, xsizeTitle, ysizeTitle, 0);

draw_text_ext_transformed(posxAll, posyPressEnter, "Press ENTER to begin", lineheightPressEnter, textwidthPressEnter, xsizeRest, ysizeRest, 0);

draw_text_ext_transformed(posxAll, posyInstructions, "WASD to Move J to Attack  K to Roll   L to Defend", lineheightInstructions, textwidthInstructions, xsizeRest, ysizeRest, 0);