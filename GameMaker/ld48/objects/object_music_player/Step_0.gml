/// @description Insert description here
// You can write your code in this editor
if (played && audio_sound_get_track_position(sound) < loop_begin_time)
{
	audio_sound_set_track_position(sound, loop_begin_time);
}