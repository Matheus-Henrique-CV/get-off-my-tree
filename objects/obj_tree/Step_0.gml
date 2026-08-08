timer--;
invencible_timer--;

if(timer <= 0)
{
	image_index = 1;	
	
	ready = true;
	
	if(ready and place_meeting(x, y, obj_player))
	{
		if(keyboard_check_pressed(ord("E")))
		{
			image_index = 0;
			timer = delay;
			ready = false;
			obj_player.hungry += irandom_range(10, 15);
		}
	}
}

if(global.leaf_qtd > 0)
{
	leaf_timer--;
	if(leaf_timer <= 0)
	{
		repeat(global.leaf_qtd)
		{
			var _leaf = instance_create_layer(x, y-sprite_height/2, "Instances", obj_leaf_2);
			_leaf.speed = 3;
			_leaf.direction = random_range(45, 135);
		}
		leaf_timer = leaf_delay;
	}
}

finaliza_hit_flash();


