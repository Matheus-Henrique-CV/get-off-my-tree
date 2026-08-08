if(global.log_qtd > 0)
{
	repeat(global.log_qtd)
	{
		var _log = instance_create_layer(x, y-sprite_height/2, "Instances", obj_log);
		_log.speed = 4;
		_log.direction = random_range(45, 135);
	}
}

