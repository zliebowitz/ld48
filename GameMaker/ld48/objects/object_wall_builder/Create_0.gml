/// @description Insert description here
// You can write your code in this editor


var color = make_colour_rgb(30,44,51);


var gridSize = 8;
var layerId = layer_create(depth-20);


// Create a grid where all walls are
for (var xPos = 0; xPos <= room_width/gridSize; xPos++)
{
	for (var yPos = 0; yPos <= room_height/gridSize; yPos++)
	{
		if instance_position(xPos * gridSize+3, yPos * gridSize+3, object_autowall)
			wallGrid[xPos, yPos] = 0;
		else
			wallGrid[xPos, yPos] = -1;
	}
}


for (var xPos = 1; xPos < room_width/gridSize - 1; xPos++)
{
	for (var yPos = 1; yPos < room_height/gridSize - 1; yPos++)
	{
		if (wallGrid[xPos, yPos] == 0)
		{
			wallGrid[xPos, yPos] = irandom(2) + 1;
			var localArea_11 = wallGrid[xPos - 1, yPos - 1] == -1 ? 0: 1;
			var localArea_12 = wallGrid[xPos, yPos - 1] == -1 ? 0: 1;
			var localArea_13 = wallGrid[xPos + 1, yPos - 1] == -1 ? 0: 1;
			var localArea_21 = wallGrid[xPos - 1, yPos] == -1 ? 0: 1;
			var localArea_23 = wallGrid[xPos + 1, yPos] == -1 ? 0: 1;
			var localArea_31 = wallGrid[xPos - 1, yPos + 1] == -1 ? 0: 1;
			var localArea_32 = wallGrid[xPos, yPos + 1] == -1 ? 0: 1;
			var localArea_33 = wallGrid[xPos + 1, yPos + 1] == -1 ? 0: 1;
			
			// Check corner pieces
			//if localArea_11 + localArea_13  + localArea_31 + localArea_33 > 0
				//wallGrid[xPos, yPos] = 1;
			// Check for being an edge
			if localArea_12 + localArea_21  + localArea_23 + localArea_32 < 3
				wallGrid[xPos, yPos] = 1;
			
			color = instance_position(xPos*gridSize+3, yPos*gridSize+3, object_autowall).image_blend;
			
			
			
			// Generate surface noise
			if wallGrid[xPos, yPos - 1] == -1
			{
				var sprite;
				if wallGrid[xPos - 1, yPos] == 1 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_1_1);
				}
				else if wallGrid[xPos - 1, yPos] == 1 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_1_2);
				}
				else if wallGrid[xPos - 1, yPos] == 1 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_1_3);
				}
				else if wallGrid[xPos - 1, yPos] == 2 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_1_2);
					layer_sprite_xscale(sprite, -1);
				}
				else if wallGrid[xPos - 1, yPos] == 2 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_2_2);
				}
				else if wallGrid[xPos - 1, yPos] == 2 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_2_3);
				}
				else if wallGrid[xPos - 1, yPos] == 3 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_1_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if wallGrid[xPos - 1, yPos] == 3 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_2_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if wallGrid[xPos - 1, yPos] == 3 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_3_3);
				}
				else
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize, ground_1_1);
				
				layer_sprite_blend(sprite, color);
			}
			// Generate Ceiling noise
			if wallGrid[xPos, yPos + 1] == -1
			{
				var sprite;
				if wallGrid[xPos - 1, yPos] == 1 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4, yPos*gridSize + 8, ground_1_1);
				}
				else if wallGrid[xPos - 1, yPos] == 1 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_1_2);
				}
				else if wallGrid[xPos - 1, yPos] == 1 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_1_3);
				}
				else if wallGrid[xPos - 1, yPos] == 2 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_1_2);
					layer_sprite_xscale(sprite, -1);
				}
				else if wallGrid[xPos - 1, yPos] == 2 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_2_2);
				}
				else if wallGrid[xPos - 1, yPos] == 2 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_2_3);
				}
				else if wallGrid[xPos - 1, yPos] == 3 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_1_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if wallGrid[xPos - 1, yPos] == 3 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_2_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if wallGrid[xPos - 1, yPos] == 3 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_3_3);
				}
				else
					sprite = layer_sprite_create(layerId, xPos*gridSize + 4,  yPos*gridSize + 8, ground_1_1);
					
				layer_sprite_yscale(sprite, -1);
				layer_sprite_blend(sprite, color);
			}
			
			
			// Generate right wall noise
			if wallGrid[xPos + 1, yPos] == -1
			{
				var prevWall = wallGrid[xPos, yPos - 1]
				var xSprite = xPos*gridSize + 8;
				var ySprite = yPos*gridSize + 4;
				var sprite;
				if prevWall == 1 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xSprite,  ySprite, ground_1_1);
				}
				else if prevWall == 1 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_1_2);
				}
				else if prevWall == 1 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_1_3);
				}
				else if prevWall == 2 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_1_2);
					layer_sprite_xscale(sprite, -1);
				}
				else if prevWall == 2 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_2_2);
				}
				else if prevWall == 2 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_2_3);
				}
				else if prevWall == 3 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_1_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if prevWall == 3 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_2_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if prevWall == 3 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_3_3);
				}
				else
					sprite = layer_sprite_create(layerId, xSprite, ySprite , ground_1_1);
				
				layer_sprite_angle(sprite, 270)
				//layer_sprite_xscale(sprite, -1);
				layer_sprite_blend(sprite, color);
			}
			
			
			// Generate left wall noise
			if wallGrid[xPos - 1, yPos] == -1
			{
				var prevWall = wallGrid[xPos, yPos - 1]
				var xSprite = xPos*gridSize;
				var ySprite = yPos*gridSize + 4;
				var sprite;
				if prevWall == 1 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_1_1);
				}
				else if prevWall == 1 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_1_2);
				}
				else if prevWall == 1 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_1_3);
				}
				else if prevWall == 2 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_1_2);
					layer_sprite_xscale(sprite, -1);
				}
				else if prevWall == 2 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_2_2);
				}
				else if prevWall == 2 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_2_3);
				}
				else if prevWall == 3 && wallGrid[xPos, yPos] == 1
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_1_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if prevWall == 3 && wallGrid[xPos, yPos] == 2
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_2_3);
					layer_sprite_xscale(sprite, -1);
				}
				else if prevWall == 3 && wallGrid[xPos, yPos] == 3
				{
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_3_3);
				}
				else
					sprite = layer_sprite_create(layerId, xSprite, ySprite, ground_1_1);
				
				layer_sprite_angle(sprite, 270)
				layer_sprite_yscale(sprite, -1);
				layer_sprite_blend(sprite, color);
				
			}
		}
	}
}

