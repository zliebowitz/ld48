/// @description Insert description here
// You can write your code in this editor

if(room != AlienPlanet1)
{
	
	if(y >= basey)
	{
		jump++;
		phy_speed_y = 0;
	}
	else
	{
		if(y < basey)
		{
			phy_speed_y++
		}
	}
	if jump >= 300
	{	
		phy_speed_y = -10
		jump = 0;	
	}
}


if abs(distance_to_object(global.player)) <= 70 && moveTime <= 0
{
	phy_speed_x = 0;
	moveTime = 100;
	moveLeft = !moveLeft;
	
}

// Attacks
if moveTime % 90 == 0
{
	bullet = instance_create_depth(x+64, y+84, 0, object_bullet);
	bullet.direction = point_direction(x+64, y+84, global.player.x, global.player.y);
	bullet.speed = 3;
}
if moveTime % 90 == 30
{
	bullet = instance_create_depth(x+136, y+84, 0, object_bullet);
	bullet.direction = point_direction(x+136, y+84, global.player.x, global.player.y);
	bullet.speed = 3;
}
if moveTime % 90 == 60
{
	bullet = instance_create_depth(x+208, y+84, 0, object_bullet);
	bullet.direction = point_direction(x+208, y+84, global.player.x, global.player.y);
	bullet.speed = 3;
}



if moveTime >= 0
{
	if moveLeft
		phy_speed_x -= acceleration;
	else
		phy_speed_x += acceleration;
	
	moveTime--;
}
else
	phy_speed_x = 0;
	
//clamp(phy_speed_x, -maxSpeedX, maxSpeedX);

if phy_speed_x > maxSpeedX
	phy_speed_x = maxSpeedX;
if phy_speed_x < -maxSpeedX
	phy_speed_x = -maxSpeedX;