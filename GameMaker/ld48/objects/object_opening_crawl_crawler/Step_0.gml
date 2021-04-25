/// @description Insert description here
// You can write your code in this editor
controller_state = MenuController();

if (controller_state.select)
{
	object_fade_out.room_id = next_room;
}

if (y > room_height + 120)
{
	object_fade_out.room_id = next_room;
}