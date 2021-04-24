/// @description Insert description here
// You can write your code in this editor


jump++;

if jump >= 300
{
	jump = 0;	
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
	
//clamp(phy_speed_x, -maxAcceleration, maxAcceleration);

if phy_speed_x > maxAcceleration
	phy_speed_x = maxAcceleration;
if phy_speed_x < -maxAcceleration
	phy_speed_x = -maxAcceleration;