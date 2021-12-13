/// @description Insert description here
// You can write your code in this editor
var posx = room_width * 0.5;
var posy = room_height * 0.5;
var lineheight = 30;
var textwidth = room_width * 0.25;

var xsize = 2;
var ysize = 2;

draw_text_ext_transformed(posx, posy, "(Placeholder) Studios        Presents...", lineheight, textwidth, xsize, ysize, 0);

draw_set_alpha(alpha);
	if ((alpha < 1) && (fadeIn > 0) && (hangTime == 180))
{
	alpha += 1/120;
	fadeIn -= 1;
}

	if ((alpha >= 1) && (hangTime > 0))
{
	hangTime -= 1;
}

	if ((alpha > 0) && (fadeOut > 0) && (hangTime < 180))
{
	alpha -= 1/120;
	fadeOut -= 1;
}