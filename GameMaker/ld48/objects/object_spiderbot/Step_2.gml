/// @description Insert description here
// You can write your code in this editor
if(global.boss_hittable)
{
	if place_meeting(x, y, spaceman_attack)
	{
		audio_play_sound(sound_slash_hit,25,false)
		global.boss_hittable = false;
		monster_health -= 1;
		if (monster_health <= 0)
		{
			audio_stop_all();
			instance_destroy(object_wall_exit.id);
			audio_play_sound(sound_boss_death,25,false);
			instance_destroy();
			
			for (var j = 0; j < sprite_height / 8; j++)
			{
				for (var i = 0; i < sprite_width / 8; i++)
				{
					if (i >= 14 && i < 20 && j >= 2 && j < 4) ||
					   (i >= 16 && i < 18 && j >= 4 && j < 8) ||
					   (i >= 3 && i < 31 && j >= 8 && j < 14)
					{
						var white_particle = instance_create_depth(x + 8 * i, y + 8 * j, depth, object_white_particle);
						white_particle.image_blend = $545454;
					}
				}
			}
		}
	}
}