/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, spaceman_attack)
{
	monster_health -= 1;
	if (monster_health <= 0)
	{
		instance_destroy();
	}
}