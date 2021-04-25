/// @description Insert description here
// You can write your code in this editor

var camX = camera_get_view_x(view_camera[0]) ;
var camY = camera_get_view_y(view_camera[0]) ;
layer_x("bg_surface_sky",  floor(camX * 0.7));
layer_y("bg_surface_sky",  floor(camY * 0.7));


layer_x("bg_surface_ground2",  floor(camX * 0.5));
layer_y("bg_surface_ground2",  floor(camY * 0.5) + 300);

layer_x("bg_surface_ground1",  floor(camX * 0.3));
layer_y("bg_surface_ground1",  floor(camY * 0.3) + 500);

layer_x("bg_surface_temple",  floor(camX * 0.4) + 500);
layer_y("bg_surface_temple",  floor(camY * 0.4) - 300);