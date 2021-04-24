/// @description Insert description here
// You can write your code in this editor

 
// Used this example for reference.
// https://forum.yoyogames.com/index.php?threads/basic-physics-platformer-controls.65895/
//

// Move right
if keyboard_check(control_right)
{
   physics_apply_force(x, y, x_force, 0); 
}

// Move left
if keyboard_check(control_left)
{
   physics_apply_force(x, y, -x_force, 0); 
}

// Lower gravity when jump is held at the peak of the jump
if (keyboard_check(control_jump) && (abs(phy_speed_y <= jump_peak_speed)))
{
	physics_world_gravity(0, y_player_jump_gravity);
}
else
{
	physics_world_gravity(0, y_player_gravity);
}

// Jump Input
if keyboard_check_pressed(control_jump) && jump_buffer_count >= jump_buffer
{
   jump_buffer_count = 0;
}
// Check / increment jump buffer
if jump_buffer_count < jump_buffer
{
   jump_buffer_count++;
}

// Player is standing on ground
if place_meeting(x, y + 1, object_collideable) || place_meeting(x, y+1, object_platform)
{
	// Limit speed more aggresively if the player is on the ground
	if (!keyboard_check(control_left) && !keyboard_check(control_right))
		phy_speed_x *= x_deceleration;
	
   // Jump if jump buffer is incrimented
   if (jump_buffer_count < jump_buffer)
	 physics_apply_impulse(x, y, 0, -y_force);
}

// Clamp movement speed so we don't accelerate forever
//phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);


if ((abs(phy_speed_x) >= max_x_speed) || (!keyboard_check(control_left) && !keyboard_check(control_right)))
{
	phy_speed_x *= x_deceleration;
}


//room borders
if x+sprite_width >= room_width 
{
	physics_apply_force(x, y, -x_force*10, 0);	
}
if x <= 0 
{
	physics_apply_force(x, y, x_force*10, 0);
}
