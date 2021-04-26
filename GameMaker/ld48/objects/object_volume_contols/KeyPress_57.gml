/// @description Insert description here
// You can write your code in this editor
global.master_volume = max(global.master_volume - 0.05, 0.0);
audio_master_gain(global.master_volume);