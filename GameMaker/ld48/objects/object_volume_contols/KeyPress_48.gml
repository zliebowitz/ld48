/// @description Insert description here
// You can write your code in this editor

global.master_volume = min(global.master_volume + 0.05, 1.0);
audio_master_gain(global.master_volume);