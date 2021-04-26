/// @description Insert description here
// You can write your code in this editor

x = orig_x;

if(global.boss_hittable == true)
{
	if place_meeting(x, y, spaceman_attack) && shake_count == max_shake_count
	{
		audio_play_sound(sound_slash_hit,25,false)
		global.boss_hittable = false;
		monster_health -= 1;
		shake_count = 0;
		
		for (var i = 0; i < 128; i++)
		{
			instance_create_depth(orig_x, y + sprite_height - 32, depth, object_sparkle);
		}
		
		if (monster_health <= 0)
		{
			instance_destroy();
			audio_play_sound(sound_boss_death, 20, false);
			
			for (var j = 0; j < sprite_height / 8; j++)
			{
				for (var i = 0; i < sprite_width / 8; i++)
				{
					instance_create_depth(orig_x + 8 * i, y + 8 * j, depth, object_white_particle);
				}
			}
		}
	}
}

if (shake_count < max_shake_count)
{
	if (floor(shake_count / 2) % 2 == 0)
	{
		x = orig_x - 2;
	}
	else
	{
		x = orig_x + 2;
	}
	
	shake_count = shake_count + 1;
}