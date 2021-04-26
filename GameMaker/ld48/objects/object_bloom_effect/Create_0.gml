/// @description Insert description here
// You can write your code in this editor

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

surface_ping = -1;
surface_pong = -1;

blur_sigma = 0.125;
blur_steps = 7.0;

application_surface_draw_enable(false);