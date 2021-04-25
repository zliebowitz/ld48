/// @description Insert description here
// You can write your code in this editor

var camX = camera_get_view_x(view_camera[0]) ;
var camY = camera_get_view_y(view_camera[0]) ;
layer_x("bg_cave_glow",  floor(camX) * 0.8 + 300);
layer_y("bg_cave_glow",  floor(camY) * 0.8 + 500);


layer_x("bg_cave_ruins",  floor(camX * 0.8) + 300);
layer_y("bg_cave_ruins",  floor(camY * 0.8) + 500);

layer_x("bg_cave_rock1",  floor(camX * 0.7));
layer_y("bg_cave_rock1",  floor(camY * 0.7));