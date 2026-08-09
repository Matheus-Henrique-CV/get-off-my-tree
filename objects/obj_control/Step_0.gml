cursor_sprite = spr_mouse;

global.points++;

if(global.points > global.record)
{
	global.record = global.points;	
}

spaw_enemy();

if(global.leaf_falling < 70)
{
	leaf_fall_timer--;
	if(leaf_fall_timer <= 0)
	{
		var _x = random_range(32, room_width-32);
		instance_create_layer(_x, -50, "Instances", obj_leaf_1)	
		leaf_fall_timer = global.leaf_falling;
	}
}

//if(keyboard_check_pressed(ord("V"))) global.wind++

if(global.wind == 0)
{
	fx_set_parameter(wind_fx, "param_num_particles", 0);	
}
else
{
	fx_set_parameter(wind_fx, "param_num_particles", global.wind*15);		
	fx_set_parameter(wind_fx, "param_wind_vector_x", global.wind * -0.5);
	fx_set_parameter(wind_fx, "param_particle_start_sprite_scale", 0.3);
	fx_set_parameter(wind_fx, "param_particle_end_sprite_scale", 0.3);
	with(obj_player)
	{
		velh = -0.05 * global.wind;	
		
		if(!place_meeting(x+sign(velh), y, colisoes))
		{
			x += velh;	
		}
		else
		{
			velh = 0;
		}	
	}

	if(irandom(2000) < global.wind)
	{
		var _x = random_range(32, room_width-32);
		instance_create_layer(_x, -50, "Instances", obj_seed);	
	}
	

}

delay_enemy = clamp(delay_enemy, 35, 100);
//Limitando as globais
global.wind = clamp(global.wind, 0, 5);
