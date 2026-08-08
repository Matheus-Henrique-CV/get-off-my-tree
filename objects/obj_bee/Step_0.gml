if(instance_exists(obj_enemy_1))
{
	speed = spd;
	var _enemy = instance_nearest(x, y, obj_enemy_1);
	direction = point_direction(x, y, _enemy.x, _enemy.y);
	//image_angle = direction;
	
	if(_enemy.x > x) image_xscale = -1;
	else image_xscale = 1;
}
else
{
	speed = 0;
}