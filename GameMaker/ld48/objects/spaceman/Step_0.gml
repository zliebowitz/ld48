/// @description Insert description here
// You can write your code in this editor

 
// Used this example for reference.
// https://forum.yoyogames.com/index.php?threads/basic-physics-platformer-controls.65895/
//

var controller_state = GameplayController();


var x_in = controller_state.x_dir;
if (x_in != 0)
{
	image_xscale = sign(x_in);
	sprite_index = sprite_avatar_running;
	physics_apply_force(x, y, x_in * x_force, 0)
}
// Idle
else
{
	sprite_index = sprite_avatar_idle;
}

// Lower gravity when jump is held at the peak of the jump
if (controller_state.jump && (abs(phy_speed_y <= jump_peak_speed)))
{
	// 125 is room gravity.
	// TODO: Can't figure out how to acces the varible.
	physics_apply_force(x,y, 0, -125/2);
}

// Jump Input
if controller_state.jump && jump_buffer_count >= jump_buffer
{
   jump_buffer_count = 0;
}
// Check / increment jump buffer
if jump_buffer_count < jump_buffer
{
   jump_buffer_count++;
}

// Player is standing on ground
if place_meeting(x, y + 1, object_collideable) || place_meeting(x, y + 1, object_platform)
{
	// Limit speed more aggresively if the player is on the ground
	if (x_in == 0)
		phy_speed_x *= x_deceleration;
	
   // Jump if jump buffer is incrimented
   if (jump_buffer_count < jump_buffer)
   {
		phy_speed_y = 0;
		physics_apply_impulse(x, y, 0, -y_force);
		jump_buffer_count = jump_buffer;
   }
}
else if place_meeting(x + 1, y, object_collideable) && (jump_buffer_count < jump_buffer)
{
	phy_speed_y = 0;
	phy_speed_x = 0;
	physics_apply_impulse(x, y, -x_force * .5, -y_force);
	jump_buffer_count = jump_buffer;
}
else if place_meeting(x - 1, y, object_collideable) && (jump_buffer_count < jump_buffer)
{
	phy_speed_y = 0;
	phy_speed_x = 0;
	physics_apply_impulse(x, y, x_force * .5, -y_force);
	jump_buffer_count = jump_buffer;
}

// Clamp movement speed so we don't accelerate forever
//phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);


if abs(phy_speed_x) >= max_x_speed || x_in == 0
{
	phy_speed_x *= x_deceleration;
}

if (controller_state.attack)
{
	// sprite-width is negative when facing right.
	var spaceman_attack_instance = instance_create_layer(x + sign(sprite_width) * 5, y, layer, spaceman_attack);
	spaceman_attack_instance.image_xscale = image_xscale;
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


