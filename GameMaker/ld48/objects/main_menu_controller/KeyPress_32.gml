/// @description Insert description here
// You can write your code in this editor

if (done)
  return;

if (selected == start_option)
{
	// Note: because the object is only crated once due to the done flag and it chagnes the room, we don't worry about the allocation.
	fadeout = instance_create_depth(0,0,depth, object_fade_out);
	fadeout.room_id = room_next(room);
	fadeout.max_fade_count = room_speed / 2;
	done = true;	
}

if (selected == exit_option)
	game_end();