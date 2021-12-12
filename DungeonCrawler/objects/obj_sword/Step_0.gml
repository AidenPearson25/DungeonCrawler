/// @description Insert description here
// You can write your code in this editor
//Making the sword move with the player
x += obj_player.xSpeed
y += obj_player.ySpeed

if (!audio_is_playing(swordSwing_wav))
{
	audio_play_sound(swordSwing_wav, 2, false);
}