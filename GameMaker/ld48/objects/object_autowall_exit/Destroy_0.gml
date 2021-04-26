/// @description Insert description here
// You can write your code in this editor

audio_play_sound(sound_boss_death, 20, false);

for (var j = 0; j < sprite_height / 8; j++)
{
	for (var i = 0; i < sprite_width / 8; i++)
	{
		var white_particle = instance_create_depth(x + 8 * i, y + 8 * j, depth, object_white_particle);
		white_particle.image_blend = $332C1E;
	}
}