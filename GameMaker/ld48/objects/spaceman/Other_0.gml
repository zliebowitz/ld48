/// @description Insert description here
// You can write your code in this editor

var next_room = room;
switch(room)
{
	case AlienPlanet1:
		next_room = AlienPlanet2Crawl
		break;
	case AlienPlanet2:
		next_room = AlienPlanet3Crawl
		break;
	default:
		break;
}

object_fade_out.room_id = next_room;