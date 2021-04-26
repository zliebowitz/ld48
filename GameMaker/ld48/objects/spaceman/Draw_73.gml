/// @description Insert description here
// You can write your code in this editor

// probably redudant, but simple to go withotu verifying.
if (!visible)
	return;

healthbar_width = 30;
healthbar_height = 4;
healthbar_x = x - (healthbar_width/2);
healthbar_y = y - sprite_height - 16;
health_stretch = (global.spaceman_health/global.spaceman_health_max)*healthbar_width;
draw_sprite(sprite_spaceman_health_background,0,healthbar_x,healthbar_y);
draw_sprite_stretched(sprite_spaceman_health,0,healthbar_x, healthbar_y, health_stretch, healthbar_height);
draw_sprite(sprite_spaceman_health_border,0,healthbar_x,healthbar_y);