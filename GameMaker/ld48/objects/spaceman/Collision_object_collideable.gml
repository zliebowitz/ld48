/// @description Insert description here
// You can write your code in this editor

// If touching a wall, should enforce max speed, and slow move speed more
if ((abs(phy_speed_x) >= max_x_speed) || (!keyboard_check(control_left) && !keyboard_check(control_right))) && (abs(phy_speed_y <= jump_peak_speed))
{
	phy_speed_x *= x_deceleration;
}
phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);