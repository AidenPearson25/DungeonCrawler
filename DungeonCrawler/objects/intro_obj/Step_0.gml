/// @description Insert description here
// You can write your code in this editor
if (fadeOut <= 0)
{
	start = true;
}

if (start == true)
{
	instance_create_layer(400, 400, "buttons_layer", startButton_obj);
	start = false;
	instance_destroy();
}