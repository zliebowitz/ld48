// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MenuController()

{
	var x_dir = 0;
	var select = false;
	
	if !variable_global_exists("controller_id") || global.controller_id < 0 || !gamepad_is_connected(global.controller_id)
	{
		global.controller_id = -1;
		var updated = false;
		
		for (i = 0; i < gamepad_get_device_count(); i++)
		{
			if gamepad_is_connected(i)
			{
				global.controller_id = i;
				updated = true;
				gamepad_set_axis_deadzone(i, .3)
				break;
			}
		}
		global.attack_was_pressed = false;
	}
	
	if global.controller_id != -1
	{
		var cid = global.controller_id;
		var x_dir = gamepad_axis_value(cid, gp_axislh);
		select = gamepad_button_check(cid, gp_face1);
		select |= gamepad_button_check(cid, gp_face2);
	}
	
	if keyboard_check(ord("A"))
	{
		x_dir = -1;
	}
	else if keyboard_check(ord("D"))
	{
		x_dir = 1;
	}
	
	select |= keyboard_check(vk_space);
  
	// TODO: to more easily fit controller api, switch to key pressed.
	select |= keyboard_check_pressed(vk_enter);

	if variable_global_exists("last_menu_x_dir")
	{
		var zero = sign(global.last_menu_x_dir) == sign(x_dir);
		global.last_menu_x_dir = x_dir;
		x_dir = zero ? 0 : x_dir;
	}
	else
	{
		global.last_menu_x_dir = x_dir;
	}

	var state = {
		left: x_dir <  0,
		right: x_dir > 0,
		select: select
	};
	
	
	return state;
}