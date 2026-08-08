inicia_hit_flash();

global.max_life = 5
life = global.max_life;
invencible_delay = 40;
invencible_timer = invencible_delay;

hungry = 100;

//Movimento
velh = 0;
max_velh = 4;
velv = 0;
max_velv = 9;
grav = 0.7;

//Variáveis do level
chao = false;
var _layer = layer_tilemap_get_id("tl_tile");
colisoes = [obj_block, _layer];

//Inputs
right = 0;
left = 0;
jump = 0;

//Estados 
estado = noone;

//Direção de onde estou olhando
dir = 1;

gun = instance_create_layer(x, y, layer, obj_gun);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
troca_sprite = function(spr) //Serve pra iniciar uma animação a partir do primeiro frame
{
	if(sprite_index != spr)
	{					
		sprite_index = spr;
		image_index = 0;
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
pega_input = function()
{
	right = keyboard_check(vk_right) or keyboard_check(ord("D")) or gamepad_button_check(4, gp_padr);
	left = keyboard_check(vk_left) or keyboard_check(ord("A")) or gamepad_button_check(4, gp_padl);	
	jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
checa_chao = function()
{
	chao = place_meeting(x, y+1, colisoes);	
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
movimento = function()
{	
	velh = (right - left) * max_velh * global.move_speed;
	
	mask_index = spr_player_idle
	
	if(velh != 0) 
	{
		dir = sign(velh); //lerp(image_xscale, sign(velh), 0.4);
		image_xscale = dir;
	}
	
	y = round(y);
	
	//Gravidade
	if(!chao)
	{
		velv += grav;
	}
	else
	{
		velv = 0;	
		
		if(jump)
		{
			velv -= max_velv+global.jump_height;
		}
	}
	
	velv = clamp(velv, -max_velv, max_velv);
	
	move_and_collide(velh, velv, colisoes, 12);
	//move_and_collide(0, velv, colisoes, 12);	
}


estado_parado = function()
{	
	troca_sprite(spr_player_idle);
	
	if(velh != 0) 
	{
		estado = estado_movendo;
	}
	
	if(jump)
	{
		instance_create_depth(x, y+6, -1, obj_part_sobe);
		estado = estado_pulando;	
	}
	
	if(!chao) estado = estado_pulando;
}


estado_movendo = function()
{	
	troca_sprite(spr_player_run);
	
	if(velh == 0) 
	{
		estado = estado_parado;
	}
	
	if(jump)
	{
		instance_create_depth(x, y+6, -1, obj_part_sobe);
		estado = estado_pulando;	
	}
	
	//if(!chao) estado = estado_pulando;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
estado_pulando = function()
{
	troca_sprite(spr_player_jump)
	
	if(place_meeting(x, y+velv, colisoes)) velv = 0;
	
	if(chao)
	{
		instance_create_depth(x, y, -1, obj_part_pouso);
		estado = estado_parado;	
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
damage = function()
{
	if(invencible_timer <= 0)
	{
		screenshake(5)
		aplica_hit_flash();
		life--;
		invencible_timer = invencible_delay;
	}
	
	if(life <= 0)
	{
		//Resetando os upgrades antes de reiniciar 
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
		
		global.game_over_txt = "AS VIDAS DO COSTELINHA ACABARAM...";
		
		room_goto(rm_game_over);
	}
}


estado = estado_parado;