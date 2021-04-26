/// @description Insert description here
// You can write your code in this editor
if (surface_exists(surface_ping))
{
	surface_free(surface_ping);
}
if (surface_exists(surface_pong))
{
	surface_free(surface_pong);
}

application_surface_draw_enable(true);