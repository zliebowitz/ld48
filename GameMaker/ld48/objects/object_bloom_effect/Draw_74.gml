/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(surface_ping))
{
	surface_ping = surface_create(gui_width, gui_height);
}
if (!surface_exists(surface_pong))
{
	surface_pong = surface_create(gui_width, gui_height);
}

#region // Apply the Luminance Filter shader on the surface

// Set the shader to filter except for the bright areas.
shader_set(shader_luminance_filter);

// Set the shader parameters
bloom_threshold_param = shader_get_uniform(shader_luminance_filter, "u_fBloom_threshold");
shader_set_uniform_f(bloom_threshold_param, 0.75);
bloom_range_param = shader_get_uniform(shader_luminance_filter, "u_fBloom_range");
shader_set_uniform_f(bloom_range_param, 0.1);

// Draw the application_surface or external_surface to surface_ping with the luminance filter shader.
surface_set_target(surface_ping);
draw_clear(c_black);

draw_surface(application_surface, 0, 0);

// Reset the target surface back to normal (the screen).
// Note: this MUST be done.
surface_reset_target();

#endregion

#region // Apply a 2-pass Gaussian Blur shader now

// Set our shader to a 2-pass Guassian Blur shader
shader_set(shader_2_pass_gaussian_blur);

// Set the shader parameters.
blur_type_param = shader_get_uniform(shader_2_pass_gaussian_blur, "u_vBlur_type");
shader_set_uniform_f(blur_type_param, 1, 0); // horizontal
surface_size_param = shader_get_uniform(shader_2_pass_gaussian_blur, "u_vSurface_size");
shader_set_uniform_f(surface_size_param, gui_width, gui_height);
sigma_param = shader_get_uniform(shader_2_pass_gaussian_blur, "u_fSigma");
shader_set_uniform_f(sigma_param, blur_sigma);
blur_steps_param = shader_get_uniform(shader_2_pass_gaussian_blur, "u_fBlur_steps");
shader_set_uniform_f(blur_steps_param, blur_steps);

// Set the surface to surface_pong now.
surface_set_target(surface_pong);
draw_clear(c_black);

// 1st pass: draw the surface_ping onto our surface_pong with the Gaussian Blur (horizontal)
draw_surface(surface_ping, 0, 0);

// Reset the surface target back to normal (the screen).
surface_reset_target();

// Set the surface to surface_ping now.
surface_set_target(surface_ping);

// 2nd pass: draw the surface_ping onto our surface_pong with the Gaussian Blur (vertical)
shader_set_uniform_f(blur_type_param, 0, 1); // vertical
draw_surface(surface_pong, 0, 0);

// Reset the target surface back to normal (the screen).
surface_reset_target();

#endregion

#region // Apply the bloom effect on top of the application surface.

// Reset the shader back to normal (passthrough)
shader_reset();

// Draw the application_surface or external_surface.
draw_surface(application_surface, 0, 0);

// Set the blend mode.
gpu_set_blendmode(bm_add);

// Draw the bloom effect on top of the application surface now.
draw_surface(surface_ping, 0, 0);

// Set the blend mode back to normal.
gpu_set_blendmode(bm_normal);

#endregion