/// @description Insert description here
// You can write your code in this editor



// Getting some intial controls working.
if keyboard_check(ord("A"))//LEFT
{
	hspeed = -walk_speed;
}
else if keyboard_check(ord("D")) //Right
{
	hspeed = walk_speed;
}
else
{
	hspeed = 0;
}

if keyboard_check(ord("W")) //Up
{
	vspeed = -walk_speed;
}
else if keyboard_check(ord("W")) //Down
{
	vspeed = walk_speed;
}
else
{
	vspeed = 0;
}