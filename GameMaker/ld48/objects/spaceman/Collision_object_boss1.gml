/// @description Insert description here
// You can write your code in this editor


xdir=point_direction(x,y, other.x + other.sprite_width / 2, y)
ydir=point_direction(x,y, x, other.y)

ximpulse=0;
yimpulse=0;

if(ydir == 270)
{
	// just going to let you stand on it.
	// weird behavior trying ot apply a yimpulse.
	//return;
	yimpulse = -30;
}
else
{
	if (xdir == 0)
	{
		ximpulse=-1000;
	}
	else
	{
		ximpulse=1000;
	}
}

physics_apply_impulse(x, y, ximpulse, yimpulse)
global.spaceman_health--;

audio_play_sound(sound_bullet_hit,40,false);

return;