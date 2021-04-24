/// @description Insert description here
// You can write your code in this editor

var alpha = 1.0 - fade_count / max_fade_count;

if (fade_count >= max_fade_count)
{
	return;
}

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], false);
draw_set_alpha(1.0);
draw_set_color(c_white);

fade_count = min(fade_count + 1, max_fade_count);