/// @description Insert description here
// You can write your code in this editor

x = room_width/2

opening_text = 
				"[The Stellar Plague]\n" +
                "First noticed in the outer reaches\n" +
				"of the galaxy, \n" +
				"this infection spreads\n" + 
				"from star to star.\n" + 
				"Once infected,\n" +
				"the star greatly shrinks in size,\n" +  
				"and its color\n" + 
				"turns to a dark purple.\n" +
				"The energry of the star greatly\n" +
				"diminishes, soon freezing all planets\n" +
				"that orbit the afflicted star. \n" +
				"A lone Rim Explorer travels deep into \n" +
				"the reaches of Plauge Space,\n" +
				"to find the cause\n" +
				"of the mysterious diseaseblabbity\n\n";

alien_planet1_text = 
				"[Dimensional Synapse]]\n" +
                "Collects power from millions of stars,]\n" +
                "and creates a permanent connection from]\n" +
                "our realm to Enclosed Space.\n\n";

alien_planet2_text = 
				"[Enclosed Space]\n" +
                "A theoretical diemensional construct that\n" +
                "intersects with our dimension.\n" +
                "Small tunnels can be opened into\n" +
                "Enclosed Space that allow for FTL travel.\n\n";
				
alien_planet3_text = 
				"[Ixcar'th]\n" +
                "Consumes the power collected through\n" +
                "the Dimensional Synapse.\n" +
                "Sees the portal between Enclosed Space\n" +
                "and reality simply as a source of food.\n\n";
				
alien_planet4_text = 
				"[Anoids]\n" +
                "Species who excavated the Dimensional Synapse,\n" +
                "and accidentally activated it.\n" +
                "They dissapeared after the activation.\n\n";


alien_planet5_text = 
				"[Illix] - Long dead civilization,\n" +
                "beings who contstructed\n" +
                "the Dimensional Synapse.\n\n";


switch(room)
{
	case OpeningCrawl:
		crawl_text = opening_text;
		room_height=1000
		break;
	case AlienPlanet1Crawl:
		crawl_text = alien_planet1_text;
		room_height=600
		break;
	case AlienPlanet2Crawl:
		crawl_text = alien_planet2_text;
		room_height=600
		break;
	case AlienPlanet3Crawl:
		crawl_text = alien_planet3_text;
		room_height=600
		break;
	case AlienPlanet4Crawl:
		crawl_text = alien_planet4_text;
		room_height=600
		break;
	case AlienPlanet5Crawl:
		crawl_text = alien_planet5_text;
		room_height=600
		break;
	default:
		crawl_text = "";
		room_height=500
		break;
}
