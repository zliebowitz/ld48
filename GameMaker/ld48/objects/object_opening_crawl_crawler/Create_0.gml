/// @description Insert description here
// You can write your code in this editor

vspeed = 0.5;

next_room = room_next(room)
switch(room)
{
	case AlienPlanet1Crawl:
		next_room = AlienPlanet1;
		break;
	case AlienPlanet2Crawl:
		next_room = AlienPlanet2;
	default:
		
		break;
}
