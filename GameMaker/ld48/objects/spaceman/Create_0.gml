/// @description Insert description here
// You can write your code in this editor


// Forces and Speeds
// Acceleration and jumping forces
x_force = 60;
y_force = 25;
x_deceleration = 0.85;
y_player_gravity = 125;
y_player_jump_gravity = y_player_gravity * 0.5;

// How fast player can move (pixels/second)
max_x_speed = 3;

// Peak at which jump gravity will be modified
jump_peak_speed = 6;

// Direction the character is facing. -1 is left, 1 is right.
player_direction = 1;


// Input buffering
// Adding a buffer in frames to make jumping more forgiving
jump_buffer = 12;
// Count placeholder (should be 0 here)
jump_buffer_count = 0;

// Controls
control_left = ord("A");
control_right = ord("D");
control_jump = vk_space;

// Prevent player from falling over.
// Disable this if you're making a face dragging game.
phy_fixed_rotation=true;

global.player = self;