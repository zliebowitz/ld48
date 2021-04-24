// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameplayController(){
  var x_dir = 0;
  if keyboard_check(ord("A"))
  {
	x_dir = -1;
  }
  else if keyboard_check(ord("D"))
  {
    x_dir = 1;
  }
	
  var jump = keyboard_check(vk_space);
  
  // TODO: to more easily fit controller api, switch to key pressed.
  var attack = keyboard_check_pressed(vk_enter);

 var state = {
	 x_dir: x_dir,
	 jump: jump,
	 attack: attack,
 };
 return state;
}