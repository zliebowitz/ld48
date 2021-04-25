/// @description Insert description here
// You can write your code in this editor
decay--;

if decay < 0
{
	instance_destroy();
}

if(phy_speed_y > 0)
{
	phy_speed_x = dsin(decay*x_oscillation_multi);	
}

if(phy_speed_y >max_fall_speed)
{
	phy_speed_y = max_fall_speed;
}