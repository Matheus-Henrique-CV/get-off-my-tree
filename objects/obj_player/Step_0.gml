pega_input();
movimento();
checa_chao();
estado();
invencible_timer--;
hungry -= 0.04;

finaliza_hit_flash();

if(keyboard_check_pressed(ord("R"))) game_restart();

x = clamp(x, 8, room_width-8);

var _gun = gun;
if(_gun and instance_exists(obj_gun))
{
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	var _x = x + lengthdir_x(15, _dir);
	var _y = y + lengthdir_y(sprite_height-10, _dir);
	
	_gun.x = _x;
	_gun.y = _y - 10;
}

hungry = clamp(hungry, 0, 100);
if(hungry <= 0)
{
	global.game_over_txt = "O COSTELINHA FICOU COM FOME...";
		
	room_goto(rm_game_over);
}

show_debug_message(velh)