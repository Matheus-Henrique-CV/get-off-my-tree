randomize()
inicia_hit_flash();

life = 5;
invencible_delay = 40;
invencible_timer = invencible_delay;

depth = 100;
sprite_index = choose(spr_tree_1, spr_tree_2, spr_tree_3, spr_tree_4, spr_tree_5);

delay = 60 * irandom_range(5, 10);
timer = delay;

leaf_delay = 60 * 2;
leaf_timer = leaf_delay;

ready = false;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
damage = function()
{
	if(invencible_timer <= 0)
	{
		screenshake(3)
		aplica_hit_flash();
		life--;
		invencible_timer = invencible_delay;
	}
	
	if(life <= 0)
	{
		instance_destroy();
	}
}