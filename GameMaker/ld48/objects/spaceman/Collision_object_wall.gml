/// @description Insert description here
// You can write your code in this editor


if (was_off_ground && place_meeting(x, y+1, object_wall))
{
	was_off_ground = false;
	var sound_id = audio_play_sound(sound_landing, 50, false);
	audio_sound_gain(sound_id, min(1, last_phy_speed_y / 2), 9999);
	// Below left to allow someone to more easily tune volume.
	
	//show_debug_message("");
	//show_debug_message(string(phy_speed_y));
	//show_debug_message(string(last_phy_speed_y));
}