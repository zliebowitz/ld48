// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawPauseMenu()
{
	DrawButtonCustom(title_struct, true);
	DrawButtonCustom(no_button, option == 0);
	DrawButtonCustom(yes_button, option == 1);
}