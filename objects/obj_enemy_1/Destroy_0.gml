var _pitch = random_range(0.5, 1.5)
audio_play_sound(snd_crow, 1, false, 1.1, 0, _pitch);

instance_create_layer(x, y, "Instances", obj_disapear_part);

//Sistema de drop de sementes
//var _drop_chance = irandom(100); 
//if(_drop_chance >= 90)
//{
//	instance_create_layer(x, y, "instances", obj_seed);	
//}

if(hitbox != noone) instance_destroy(hitbox)

var _bee_chance = irandom(100);
if(_bee_chance < global.bee_chance)
{
	instance_create_layer(x, y, "Instances", obj_bee);	
}

var _explosion_chance = irandom(100);
if(_explosion_chance < global.explosion_chance)
{
	instance_create_layer(x, y, "Instances", obj_explosion);	
}

if(global.ice_qtd > 0)
{
	repeat(global.ice_qtd)
	{
		var _ice = instance_create_layer(x, y, "Instances", obj_ice);
		_ice.speed = 4;
		_ice . direction = random(359);
	}
}

if(global.feathers_qtd > 0)
{
	repeat(global.feathers_qtd)
	{
		var _ice = instance_create_layer(x, y, "Instances", obj_feather);
		_ice.speed = 3;
		_ice . direction = random(359);
	}
}

var _web_chance = irandom(100);
if(_web_chance < global.web_chance)
{
	instance_create_layer(x, y, "Instances", obj_cobweb);	
}








