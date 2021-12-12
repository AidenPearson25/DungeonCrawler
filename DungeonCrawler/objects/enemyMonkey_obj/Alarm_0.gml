/// @description Throwing rocks
audio_play_sound(monkeyThrow_wav, 5, false);

instance_create_layer(x, y, "enemyRocks_layer", enemyRock_obj);

alarm_set(0, 180);