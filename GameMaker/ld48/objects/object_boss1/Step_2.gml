/// @description Insert description here
// You can write your code in this editor

if(global.boss_hittable == true)
{
	if place_meeting(x, y, spaceman_attack)
	{
		audio_play_sound(sound_slash_hit,25,false)
		global.boss_hittable = false;
		monster_health -= 1;
		if (monster_health <= 0)
		{
			instance_destroy();
			audio_play_sound(sound_boss_death, 20, false)
		}
	}
}
