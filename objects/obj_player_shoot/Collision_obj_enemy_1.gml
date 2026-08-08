instance_destroy(other);

if(global.hit > 0 and instance_exists(obj_enemy_1))
{
	global.hit--;
	var _enemy = instance_nearest(x, y, obj_enemy_1)
	direction = point_direction(x, y, _enemy.x, _enemy.y);	
	image_angle = direction - 90;
	
}
else
{
	instance_destroy();
	global.hit = global.max_hit
}

