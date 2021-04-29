/// @description Insert description here
// You can write your code in this editor

y_velocity = 0.7;

next_room = room_next(room)
switch(room)
{
	case EndCredits:
		next_room = MainMenu;
		break;
	default:
		break;
}
