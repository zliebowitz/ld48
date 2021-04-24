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

// Player is standing on ground and account for jump_buffer
if place_meeting(x, y + 1, object_wall) && jump_buffer_count < jump_buffer
{
   // Jump!
   physics_apply_impulse(x, y, 0, -y_force);
}

// Clamp movement speed so we don't accelerate forever
phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);