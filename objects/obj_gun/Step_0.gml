timer--;
if(timer < 0 and mouse_check_button(mb_left))
{
	shoots_left = global.bolotas;
	
	var _shoot = instance_create_layer(x, y, "Instances", obj_player_shoot);
	_shoot.speed = 4;
	_shoot.direction = point_direction(x, y, mouse_x, mouse_y);
	_shoot.image_angle = _shoot.direction-90;

	timer = delay;
}	

if(shoots_left > 0)
{
	timer_between_shoots--;
	if(timer_between_shoots <= 0)
	{
		var _shoot = instance_create_layer(x, y, "Instances", obj_player_shoot);
		_shoot.speed = 4;
		_shoot.direction = point_direction(x, y, mouse_x, mouse_y);
		_shoot.image_angle = _shoot.direction-90;
		timer_between_shoots = delay_between_shoots;
		shoots_left--;
	}
}

image_angle = point_direction(x, y, mouse_x, mouse_y);

if(image_angle > 90 and image_angle < 270)
{
	image_yscale = -1.2;
}
else
{
	image_yscale = 1.2;
}

if(keyboard_check_pressed(ord("B"))) global.bolotas++