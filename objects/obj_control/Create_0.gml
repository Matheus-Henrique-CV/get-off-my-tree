randomize();

audio_play_sound(snd_soundtrack, 1, true);

wind_fx = fx_create("_effect_windblown_particles");
fx_set_parameter(wind_fx, "param_num_particles", 0);	
layer_set_fx("fx_wind", wind_fx);


//Criando as árvores iniciais
tree_x = random_range(32, room_width-32);
instance_create_layer(tree_x, -50, "Instances", obj_seed);
tree_x = random_range(32, room_width-32);
instance_create_layer(tree_x, -60, "Instances", obj_seed);
tree_x = random_range(32, room_width-32);
instance_create_layer(tree_x, -70, "Instances", obj_seed);
tree_x = random_range(32, room_width-32);
instance_create_layer(tree_x, -80, "Instances", obj_seed);
tree_x = random_range(32, room_width-32);
instance_create_layer(tree_x, -90, "Instances", obj_seed);

delay_enemy = 70;
timer_enemy = delay_enemy;

delay_between_wave = 60 * 3;
timer_between_wave = delay_between_wave;
active_wave = true;

enemies_per_wave = 10;
enemies_increase = 4;
actual_enemies = 0;

can_create_upgrades = false;

leaf_fall_delay = global.leaf_falling;
leaf_fall_timer = leaf_fall_delay;


spaw_enemy = function()
{
	timer_enemy--;
	if(timer_enemy <= 0 and actual_enemies < enemies_per_wave)
	{
		var _side = choose("up", "right", "left");
		var _x = 0;
		var _y = 0;
		switch(_side)
		{
			case "up":
				_x = random_range(0, room_width);
				_y = random_range(-20, -30);
				instance_create_layer(_x, _y, "Instances", obj_enemy_1);
				timer_enemy = delay_enemy;
				actual_enemies++;
				delay_enemy-=0.2;
			break
			
			case "left":
				_x = random_range(-10, -30);
				_y = random_range(0, room_width/3);
				instance_create_layer(_x, _y, "Instances", obj_enemy_1);
				timer_enemy = delay_enemy;
				actual_enemies++;
				delay_enemy -= 0.2;
			break
			
			case "right":
				_x = random_range(room_width+10, room_width+30);
				_y = random_range(0, room_width/3);
				instance_create_layer(_x, _y, "Instances", obj_enemy_1);
				timer_enemy = delay_enemy;
				actual_enemies++;
				delay_enemy-=0.2;
			break
		}
	}
	
	if(actual_enemies >= enemies_per_wave)
	{
		active_wave = false;
	}
	
	if(can_create_upgrades) upgrades();
	
	if(active_wave) can_create_upgrades = false;
	else if(!active_wave and !instance_exists(obj_enemy_1) and timer_between_wave == delay_between_wave)
	{
		can_create_upgrades = true; 
		timer_between_wave--;
	}
	else
	{
		can_create_upgrades = false;	
	}
		
	if(!active_wave and !instance_exists(obj_enemy_1) and !instance_exists(obj_card))
	{
		timer_between_wave--;
		if(timer_between_wave <= 0)
		{
			actual_enemies = 0;
			enemies_per_wave += enemies_increase;
			timer_between_wave = delay_between_wave;
			active_wave = true;
		}
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

upgrades = function()
{
	global.choose_upgrades = true;
	
	if(!instance_exists(obj_card))
	{
		var _cam = view_get_camera(0)
		var _x = camera_get_view_x(_cam) + camera_get_view_width(_cam) / 2;
		var _y = room_height/2;
		
		var _card_1 = instance_create_layer(_x, _y, layer, obj_card);
		var _card_2 = instance_create_layer(_x-170, _y, layer, obj_card);
		var _card_3 = instance_create_layer(_x+170, _y, layer, obj_card);
		
		var _index = irandom(array_length(global.different_cards) - 1)
		_card_1.image_index = global.different_cards[_index];
		array_delete(global.different_cards, _index, 1);

		_index = irandom(array_length(global.different_cards) - 1)
		_card_2.image_index = global.different_cards[_index];
		array_delete(global.different_cards, _index, 1);
		
		_index = irandom(array_length(global.different_cards) - 1)
		_card_3.image_index = global.different_cards[_index];
		array_delete(global.different_cards, _index, 1);
		
		instance_deactivate_all(true);
		instance_activate_object(obj_card);
	}
}








