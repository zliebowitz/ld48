/// @description Insert description here
// You can write your code in this editor

x = room_width/2

opening_text = 
				"- The Stellar Plague -\n" +
                "First noticed in the outer reaches\n" +
				"of the galaxy, \n" +
				"this infection spreads\n" + 
				"from star to star.\n" + 
				"Once infected,\n" +
				"the star greatly shrinks in size,\n" +  
				"and its color\n" + 
				"turns to a dark purple.\n" +
				"The energy of the star greatly\n" +
				"diminishes, soon freezing all planets\n" +
				"that orbit the afflicted star.\n\n\n\n\n\n" +
				"A lone Rim Explorer travels deep into\n" +
				"the reaches of Plauge Space\n" +
				"to find the cause\n" +
				"of the mysterious disease.\n\n";

alien_planet1_text = 
				"- Dimensional Synapse -\n" +
                "Collects power from millions of stars\n" +
                "and creates a permanent connection from\n" +
                "our realm to Enclosed Space.\n\n";

alien_planet2_text = 
				"- Enclosed Space -\n" +
                "A theoretical diemensional construct that\n" +
                "intersects with our dimension.\n" +
                "Small tunnels can be opened into\n" +
                "Enclosed Space that allow for FTL travel.\n\n";
				
alien_planet3_text = 
				"- Ixcar'th -\n" +
                "Consumes the power collected through\n" +
                "the Dimensional Synapse.\n" +
                "Sees the portal between Enclosed Space\n" +
                "and reality simply as a source of food.\n\n";
				
alien_planet4_text = 
				"- Anoids -\n" +
                "Species who excavated the Dimensional Synapse\n" +
                "and accidentally activated it.\n" +
                "They dissapeared after the activation.\n\n";


alien_planet5_text = 
				"- Illix -\n" +
				"A Long dead civilization\n" +
                "with beings who contstructed\n" +
                "the Dimensional Synapse.\n\n";
				
alien_planet6_text =
				"- Epilogue -\n" +
				"With the Dimensional Synapse destroyed,\n" +
				"Ixcar'th is no longer able to exert his\n" +
				"influence upon this universe. The infected\n" +
				"stars will remain dark to serve as a reminder\n" +
				"that Ixcar'th is not dead...\n\n\n\n\n\n\n" +
				"Just asleep once more...\n\n";
				
alien_planet7_text =
				"- Credits -\n" +
				"\n" +
				"Game Created By:\n" +
				"Travis Benderman\n" +
				"Stephen Hoskins\n" +
				"Zachary Liebowitz\n" +
				"Joshua Luoni\n" +
				"\n" +
				"Programming:\n" +
				"Travis Benderman\n" +
				"Stephen Hoskins\n" +
				"Zachary Liebowitz\n" +
				"Joshua Luoni\n" +
				"\n" +
				"Graphics:\n" +
				"Travis Benderman\n" +
				"Stephen Hoskins\n" +
				"Zachary Liebowitz\n" +
				"Joshua Luoni\n" +
				"\n" +
				"Music:\n" +
				"Stephen Hoskins\n" +
				"\n" +
				"Sound Effects:\n" +
				"Travis Benderman\n" +
				"Stephen Hoskins\n" +
				"Joshua Luoni\n" +
				"\n\n\n\n\n\n\n\n\n" +
				"Thank you very much for\n" +
				"playing our game.\n" +
				"We look forward to bringing\n" +
				"you our next adventure!\n";

switch(room)
{
	case OpeningCrawl:
		crawl_text = opening_text;
		room_height=1024;
		break;
	case AlienPlanet1Crawl:
		crawl_text = alien_planet1_text;
		room_height=600;
		break;
	case AlienPlanet2Crawl:
		crawl_text = alien_planet2_text;
		room_height=600;
		break;
	case AlienPlanet3Crawl:
		crawl_text = alien_planet3_text;
		room_height=600;
		break;
	case AlienPlanet4Crawl:
		crawl_text = alien_planet4_text;
		room_height=600;
		break;
	case AlienPlanet5Crawl:
		crawl_text = alien_planet5_text;
		room_height=600;
		break;
	case Epilogue:
		crawl_text = alien_planet6_text;
		room_height=600;
		break;
	case EndCredits:
		crawl_text = alien_planet7_text;
		room_height=1520;
		break;
	default:
		crawl_text = "";
		room_height=500
		break;
}
