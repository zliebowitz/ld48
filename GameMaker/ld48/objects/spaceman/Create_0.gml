/// @description Insert description here
// You can write your code in this editor

global.spaceman_health = 100

// Forces and Speeds
// Acceleration and jumping forces
x_force = 60;
y_force = 25;
x_deceleration = 0.85;

// How fast player can move (pixels/second)
max_x_speed = 3;

// Peak at which jump gravity will be modified
jump_peak_speed = 6;

// Input buffering
// Adding a buffer in frames to make jumping more forgiving
jump_buffer = 12;
// Count placeholder (should be 0 here)
jump_buffer_count = 0;

// Prevent player from falling over.
// Disable this if you're making a face dragging game.
phy_fixed_rotation=true;

// Set the global gravity to 125 downwards.
physics_world_gravity(0, 125);

// How long the player must wait before being able to attack again.
max_attack_delay_count = room_speed / 2;
attack_delay_count = max_attack_delay_count;

global.player = self;