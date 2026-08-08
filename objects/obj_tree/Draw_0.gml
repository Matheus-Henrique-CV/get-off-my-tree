draw_self();
desenha_hit_flash();

if(ready)
{
	draw_sprite(spr_ready, 0, x, y-sprite_height-10);
	if(place_meeting(x, y, obj_player))
	{
		draw_set_font(fnt_menu);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_text_transformed(x, y-sprite_height/2, "Pressione 'E' para comer!", 0.3, 0.3, 0)	
		draw_set_valign(-1);
		draw_set_halign(-1);
		draw_set_font(-1);
	}
}	

draw_healthbar(x-30, y, x+30, y-3, life*20, c_black, c_red, c_red, 180, true, true);
