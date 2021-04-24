/// @description Insert description here
// You can write your code in this editor

if (done)
  return;

// don't want to bother with negative numbers
selected = (selected + array_length(options) - 1) % array_length(options);

audio_play_sound(sound_menu_select, 10, false);