// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameplayController()

{
	var x_dir = 0;
	var jump = false;
	var attack = false;
	
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
		x_dir = gamepad_axis_value(cid, gp_axislh);
		jump = gamepad_button_check(cid, gp_face1);
		attack = gamepad_button_check(cid, gp_face3);
		if (global.attack_was_pressed)
		{
			global.attack_was_pressed = attack;
			attack = false;
		}
		
		if (x_dir == 0)
		{
			if (gamepad_button_check(cid, gp_padl))
			{
				x_dir = -1;
			}
			else if (gamepad_button_check(cid, gp_padr))
			{
				x_dir = 1;
			}
		}
	}
	
	if keyboard_check(ord("A"))
	{
		x_dir = -1;
	}
	else if keyboard_check(ord("D"))
	{
		x_dir = 1;
	}
	
	jump |= keyboard_check(vk_space);
  
	// TODO: to more easily fit controller api, switch to key pressed.
	attack |= keyboard_check(vk_enter);

	var state = {
		x_dir: x_dir,
		jump: jump,
		attack: attack,
	};
	
	return state;
}