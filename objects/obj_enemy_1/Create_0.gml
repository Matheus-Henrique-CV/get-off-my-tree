randomize();

depth = -100

xscale = 1.6;
image_yscale = 1.6;

speed = random_range(1, 2);
spd = speed;

delay_attack = 50;
timer_attack = delay_attack;

hitbox = noone;
hitbox_exists = false

state = "move"

freeze = false;

if(instance_exists(obj_tree)) target = choose(obj_player, obj_tree);
else target = obj_player;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
troca_sprite = function(spr) //Serve pra iniciar uma animação a partir do primeiro frame
{
	if(sprite_index != spr)
	{					
		sprite_index = spr;
		image_index = 0;
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
state_machine = function()
{
	switch(state)
	{
		case "move":		
			troca_sprite(spr_inimigo_1);
			
			timer_attack--;
		
			if(instance_exists(target) and !place_meeting(x, y, obj_cobweb))
			{
				var _dir = point_direction(x, y, target.x, target.y-sprite_height/2);
				direction += angle_difference(_dir, direction) * 0.5;
	
				if(target.x > x) image_xscale = -xscale;
				else image_xscale = xscale
				
				var _dist = point_distance(x, y, target.x, target.y-sprite_height/2)
				if(_dist < 20)
				{
					speed = 0;
					if(timer_attack <= 0)
					{
						state = "attack";
					}
				}
				else
				{ 
					speed = spd;	
				}
			}
			else
			{
				target = obj_player;	
			}
			
		break
		
		case "attack":
			troca_sprite(spr_inimigo_1_atk);
			speed = 0;
			
			if(image_index > 1 and !hitbox_exists)
			{
				hitbox_exists = true;
				hitbox = instance_create_layer(x, y, "Instances", obj_enemy_hitbox);	
				hitbox.x = x;
				hitbox.y = y;
			}
			
			if(image_index >= image_number)
			{
				state = "move";	
				timer_attack = delay_attack;
				instance_destroy(hitbox);
				hitbox_exists = false;
			}
		break
	}
}