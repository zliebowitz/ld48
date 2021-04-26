/// @description Insert description here
// You can write your code in this editor

fade_count++;

image_alpha = 1.0 - fade_count / max_fade_count;

//image_angle += rotation_speed;
fall_speed += fall_acceleration;

x += horizontal_speed;
y += fall_speed;

if (fade_count = max_fade_count)
{
	instance_destroy();
}