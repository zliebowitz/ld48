/// @description Insert description here
// You can write your code in this editor


if(enable_fire_rain)
{
firerain_step++;
if(firerain_step >= firerain_delay)
{
	for(i = 0; i < firerain_count; i++)
	{
		firebullet = instance_create_depth(x+sprite_width/2, y, 0, object_firebullet);
		var bullet_dir=random_range(45,135);
		firebullet.phy_speed_y = -(dsin(bullet_dir) * firerain_initial_speed);
		firebullet.phy_speed_x = (dcos(bullet_dir) * firerain_initial_speed);
		firerain_step=0
	}
	audio_play_sound(sound_fire_shoot,50,false);
}
}



if(enable_jump)
{
	
	if(y >= basey)
	{
		if(jump == 0)
		{
			y = basey;
			audio_play_sound(sound_boss_land,50,false);
		}
		jump++;
		phy_speed_y = 0;
	}
	else
	{
		if(y < basey)
		{
			phy_speed_y++
		}
	}
	if jump >= jump_delay
	{	
		phy_speed_y = jump_initial_speed
		jump = 0;
		audio_play_sound(sound_boss_jump,50,false);
	}
	
}

if abs(distance_to_object(global.player)) <= 70 && moveTime <= 0
{
	phy_speed_x = 0;
	moveTime = bullet_hell_cycle;
	moveLeft = !moveLeft;
}

if(enable_bullet_hell)
{
	var bullet_hell_modulus = floor(bullet_hell_cycle-10);
	var bullet_hell_delay =  floor(bullet_hell_modulus/3);
	
	// Attacks
	if moveTime %  bullet_hell_modulus == 0
	{
		bullet = instance_create_depth(x+64, y+84, 0, object_bullet);
		bullet.direction = point_direction(x+64, y+84, global.player.x, global.player.y);
		bullet.speed = 3;
	}
	if moveTime % bullet_hell_modulus == bullet_hell_delay
	{
		bullet = instance_create_depth(x+136, y+84, 0, object_bullet);
		bullet.direction = point_direction(x+136, y+84, global.player.x, global.player.y);
		bullet.speed = 3;
	}
	if moveTime % bullet_hell_modulus == floor(bullet_hell_delay*2)
	{
		bullet = instance_create_depth(x+208, y+84, 0, object_bullet);
		bullet.direction = point_direction(x+208, y+84, global.player.x, global.player.y);
		bullet.speed = 3;
	}
}



if moveTime >= 0
{
	if moveLeft
		phy_speed_x -= acceleration;
	else
		phy_speed_x += acceleration;
	
	moveTime--;
}
else
	phy_speed_x = 0;
	
//clamp(phy_speed_x, -maxSpeedX, maxSpeedX);

if phy_speed_x > maxSpeedX
	phy_speed_x = maxSpeedX;
if phy_speed_x < -maxSpeedX
	phy_speed_x = -maxSpeedX;
	

if (distance_to_object(spaceman) < 512 && !audio_is_playing(sound_boss_battle))
{
	audio_stop_all();
	object_music_player.sound = audio_play_sound(sound_boss_battle, 10, true);
	object_music_player.played = false;
	object_music_player.loop_begin_time = 0.0;
	object_music_player.alarm[0] = object_music_player.loop_begin_time * room_speed;
}