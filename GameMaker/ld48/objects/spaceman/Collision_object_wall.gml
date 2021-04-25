/// @description Insert description here
// You can write your code in this editor


if (was_off_ground && place_meeting(x, y+1, object_wall))
{
	was_off_ground = false;
	audio_play_sound(sound_landing, 50, false);
}