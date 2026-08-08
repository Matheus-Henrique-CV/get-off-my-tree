var _x = 20;
for(var _i = 0; _i < global.max_life; _i++)
{
	draw_sprite(spr_life_2, 0, _x, 15);
	_x += 20;
}

_x = 20;
for(var _i = 0; _i < life; _i++)
{
	draw_sprite(spr_life, 0, _x, 15);
	_x += 20;
}

draw_healthbar(20, 40, 200, 50, hungry, c_black, c_maroon, c_orange, 180, true, true);

draw_sprite(spr_apple_icon, 0, 30, 45);