/// @description Insert description here
// You can write your code in this editor

healthbar_width = 126;
healthbar_height = 6;
healthbar_x = x + (sprite_width/2) - (healthbar_width/2);
healthbar_y = y - 50;
health_stretch = (monster_health/monster_health_max)*healthbar_width;
draw_sprite(sprite_health_background,0,healthbar_x,healthbar_y);
draw_sprite_stretched(sprite_boss_health,0,healthbar_x, healthbar_y, health_stretch, healthbar_height);
draw_sprite(sprite_health_border,0,healthbar_x,healthbar_y);

draw_self();