image_angle = lerp(image_angle, 0, 0.2);

if(position_meeting(mouse_x, mouse_y, self))
{
	image_xscale = 1.2;
	image_yscale = 1.2;
	
	if(mouse_check_button_released(mb_left))
	{
		audio_play_sound(snd_upgrade, 1, false);
		
		if(image_index == 0) //Inimigos spawnam abelhas
		{
			global.bee_chance += 10;
		}
		
		if(image_index == 1) //Cai uma semente do céu
		{
			var _x = random_range(32, room_width-32);
			instance_create_layer(_x, -50, "Instances", obj_seed);
		}
		
		if(image_index == 2) //Aumenta o número de bolotas
		{
			global.bolotas++;
		}
		
		if(image_index == 3) //Spawna uma colmeia nas árvores
		{
			instance_activate_object(obj_tree);
			if(instance_exists(obj_tree))
			{
				with(obj_tree)
				{
					var _beehive = instance_create_layer(x, y-sprite_height/2, "Instances", obj_beehive);	
					_beehive.creator = self;
				}
			}
		}
		
		if(image_index == 4) //Aumenta a velocidade de movimento
		{
			global.move_speed += 0.15;
		}
		
		if(image_index == 5) //Recupera a vida
		{
			instance_activate_object(obj_player);
			obj_player.life = global.max_life;
		}
		
		if(image_index == 6) //Inimigos podem explodir
		{
			global.explosion_chance += 10;
		}
		
		if(image_index == 7) //Inimigos podem soltar gelo
		{
			global.ice_qtd++;
		}
		
		if(image_index == 8) //Árvores soltam galhos
		{
			global.log_qtd++;
		}
		
		if(image_index == 9) //Aumenta a vida máxima
		{
			global.max_life++;
		}
		
		if(image_index == 10) //Folhas caem do céu
		{
			global.leaf_falling -= 10;
		}
		
		if(image_index == 11) //Inimigos soltam penas
		{
			global.feathers_qtd++;
		}
		
		if(image_index == 12) //Aumenta a altura do pulo
		{
			global.jump_height += 0.5;
		}
		
		if(image_index == 13) //As bolotas ricocheteam
		{
			global.hit++;
			global.max_hit++;
		}
		
		if(image_index == 14) //Recupera a fome
		{
			instance_activate_object(obj_player);
			obj_player.hungry = 100;
		}
		
		if(image_index == 15) //Prende os inimigos na teia 
		{
			global.web_chance += 10;
		}
		
		if(image_index == 16) //Vento
		{
			global.wind++;
		}
		
		if(image_index == 17) //Árvores soltam folhas
		{
			global.leaf_qtd++;
		}
		
		global.different_cards = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
		//global.choose_upgrades = false;
		instance_destroy(obj_card);
	}
}
else
{
	image_xscale = 1;	
	image_yscale = 1;	
}
