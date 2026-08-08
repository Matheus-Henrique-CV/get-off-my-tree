pega_input();
movimento();
checa_chao();
estado();
invencible_timer--;
hungry -= 0.04;

finaliza_hit_flash();

//if(keyboard_check_pressed(ord("R"))) game_restart();

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
	audio_stop_sound(snd_soundtrack);
	
	global.bee_chance = 0;
	global.bolotas = 0;
	global.move_speed = 1;
	global.max_life = 0;
	global.explosion_chance = 0;
	global.ice_qtd = 0;
	global.log_qtd = 0;
	global.feathers_qtd = 0;
	global.jump_height = 0;
	global.max_hit = 0;
	global.hit = 0;
	global.leaf_falling = 70;
	global.web_chance = 0;
	global.leaf_qtd = 0;
	global.feathers_qtd = 0;
	global.wind = 0;
	
	global.game_over_txt = "O COSTELINHA FICOU COM FOME...";
	
	global.points = 0;
		
	room_goto(rm_game_over);
}

show_debug_message(velh)