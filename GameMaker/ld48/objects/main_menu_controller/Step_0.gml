/// @description Insert description here
// You can write your code in this editor

// don't process further if done
if (done)
	return;

var controller_state = MenuController();

if (controller_state.left)
{
	selected = (selected + array_length(options) - 1) % array_length(options);

	audio_play_sound(sound_menu_select, 10, false);
}
else if (controller_state.right)
{
	selected = (selected + 1) % array_length(options);

	audio_play_sound(sound_menu_select, 10, false);
}
else if (controller_state.select)
{
	if (selected == start_option)
	{
		// Note: because the object is only crated once due to the done flag and it chagnes the room, we don't worry about the allocation.
		fadeout = instance_create_depth(0,0,depth, object_fade_out);
		fadeout.room_id = room_next(room);
		//fadeout.room_id = AlienPlanet4Test;
		fadeout.max_fade_count = room_speed / 2;
		done = true;	
	}
	else if (selected == exit_option)
	{
		game_end();
	}
}