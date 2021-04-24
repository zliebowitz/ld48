/// @description Insert description here
// You can write your code in this editor


// Getting some intial controls, collision, and physics going.
if keyboard_check(ord("A")) && place_free(x - space_ahead,y)
{ // Move left
	x -= walk_speed;
}
else if keyboard_check(ord("D")) && place_free(x + space_ahead,y)
{ // move right
	x += walk_speed;
}


if keyboard_check_pressed(vk_space) && !place_free(x,y+space_ahead)
{ // Jump
	vspeed = -jump_height;
}

if place_free(x,y + space_ahead)
{
	gravity = 1;
}
else
{
	gravity = 0;	
}