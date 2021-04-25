/// @description Insert description here
// You can write your code in this editor

// assuming the default (fa_left) is used
draw_set_halign(fa_center);

draw_text_transformed_color(view_wport[0] / 2, view_hport[0] / 10 + 48, title, 1, 1, 0, c_white, c_white, c_white, c_white, 1)

var num_options = array_length(options);

// delta_time is in microseconds
counter += delta_time;
counter %= 1000000;

for (i = 0; i < num_options; i++)
{
	if (selected == i && counter < 500000)
		var color = selected_color;
	else
		var color = unselected_color;
		
	draw_text_transformed_color((1 + i) * view_wport[0] / (num_options + 1), 3 * view_hport[0] / 5, options[i], 1, 1, 0, color, color, color, color, 1);
}

draw_set_halign(fa_left);