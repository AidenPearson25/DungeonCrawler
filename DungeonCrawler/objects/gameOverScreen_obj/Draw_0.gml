/// @description Insert description here
// You can write your code in this editor
var posxAll = room_width * 0.5;
var posyGameOver = room_height * 0.2;
var lineheightGameOver = 0;
var textwidthGameOver = room_width * 0.75;

var xsizeGameOver = 4;
var ysizeGameOver = 4;

var posyContinue = room_height * 0.6;
var lineheightContinue = 20;
var textwidthContinue = room_width * 0.3;

var xsizeContinue = 1;
var ysizeContinue = 1;

draw_text_ext_transformed(posxAll, posyGameOver, "GAME OVER", lineheightGameOver, textwidthGameOver, xsizeGameOver, ysizeGameOver, 0);
draw_text_ext_transformed(posxAll, posyContinue, "Press ENTER to return to title", lineheightContinue, textwidthContinue, xsizeContinue, ysizeContinue, 0);