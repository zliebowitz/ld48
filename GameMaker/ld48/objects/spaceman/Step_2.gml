/// @description Insert description here
// You can write your code in this editor
if (!visible)
{
	return;
}

var bullet_id = (instance_place(x,y,object_bullet)) // check for a collision and return the id of the bullet inside bullet_id
if(bullet_id != noone)
{

    global.spaceman_health--;
	var bullet_force = 1000
    var xforce = bullet_id.hspeed * bullet_force;

	physics_apply_impulse(x, y, xforce, 0)
    instance_destroy(bullet_id); // destroy that single bullet from the id you stored
	audio_play_sound(sound_bullet_hit,40,false)
	
}

var bullet_id = (instance_place(x,y,object_firebullet)) // check for a collision and return the id of the bullet inside bullet_id
if(bullet_id != noone)
{

    global.spaceman_health--;
	var bullet_force = 1000
    var xforce = bullet_id.hspeed * bullet_force;

	physics_apply_impulse(x, y, xforce, 0)
    instance_destroy(bullet_id); // destroy that single bullet from the id you stored
	audio_play_sound(sound_bullet_hit,40,false)
	
}


if (global.spaceman_health <= 0)
{
	if(instance_number(spaceman_attack) > 0)
	{
			instance_destroy(spaceman_attack)
	}
	// trigger level restart
	alarm[0] = 3 * room_speed;
	for (var j = 0; j < sprite_height / 2; j++)
	{
		for (var i = 0; i < sprite_width / 2; i++)
		{
			var particle = instance_create_depth(bbox_left + 4 * i, bbox_top + 4 * j, depth, object_white_particle);
			particle.image_xscale = .25;
			particle.image_yscale = .25;
		}
	}
	global.spaceman_health = 10;
	audio_play_sound(sound_player_death,20,false)
	visible = false;
	// these two should siable all collisions.
	solid = false;
	phy_active = false;
}