/// @description Insert description here
// You can write your code in this editor
draw_set_font(emulogic_font);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(1);

//Opacity for intro
alpha = 0;

fadeIn = 120; //How long our intro will fade in for
hangTime = 180; //How long the intro will stay
fadeOut = 120; //How long the it takes for the intro to fade out to make the start menu

start = false;