/// @description Insert description here
// You can write your code in this editor

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
	instance_destroy();
	global.spaceman_health = 10;
	audio_play_sound(sound_player_death,20,false)
}