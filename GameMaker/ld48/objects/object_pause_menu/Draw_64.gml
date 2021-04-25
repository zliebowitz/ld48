/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(my_application_surface))
{
	my_application_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
}
		
if (paused && !exiting)
{
	// draw our copy of the application surface while paused
	draw_surface(my_application_surface, 0, 0);
	
	// draw a fade in effect
	draw_set_color(c_black);
	draw_set_alpha(max_fade_alpha * fade_count / max_fade_count);
	draw_rectangle(0, 0, surface_get_width(my_application_surface), surface_get_height(my_application_surface), false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	
	// draw the pause menu
	pause_menu_height = 2 + (max_pause_menu_height - 2) * fade_count / max_fade_count;
	DrawPauseMenu();
	
	fade_count = min(fade_count + 1, max_fade_count);
}
// fade out the pause menu here
else if (fade_count < max_fade_count)
{
	// handle exiting to the title screen transition, if operator wants to exit
	if (exiting)
	{
		// draw our copy of the application surface while paused
		draw_surface(my_application_surface, 0, 0);
		
		// darken our copy of the application surface
		draw_set_color(c_black);
		draw_set_alpha(max_fade_alpha + 0.2 * fade_count / max_fade_count);
		draw_rectangle(0, 0, surface_get_width(my_application_surface), surface_get_height(my_application_surface), false);
		draw_set_alpha(1.0);
		draw_set_color(c_white);
	}
	// otherwise, handle fading out the pause menu and returning to the game in progress
	else
	{
		// draw a fade out effect
		draw_set_color(c_black);
		draw_set_alpha(max_fade_alpha - max_fade_alpha * fade_count / max_fade_count);
		draw_rectangle(0, 0, surface_get_width(my_application_surface), surface_get_height(my_application_surface), false);
		draw_set_alpha(1.0);
		draw_set_color(c_white);
	}
	
	// draw the pause menu
	pause_menu_height = 2 + (max_pause_menu_height - 2) * (1.0 - fade_count / max_fade_count);
	DrawPauseMenu();
	
	if (exit_count == max_exit_count)
	{
		fade_count = min(fade_count + 1, max_fade_count);
	}
	else
	{
		exit_count++;
	}
}