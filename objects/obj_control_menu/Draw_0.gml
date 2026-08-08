draw_set_font(fnt_card);
if(room == rm_menu) draw_text(20, room_height-20, "Jogo feito para a NoneJam 13");
draw_set_font(-1);

if(room == rm_game_over)
{
	draw_set_font(fnt_menu);
	draw_set_halign(fa_center);
	draw_text(room_width/2, 75, global.game_over_txt);
	draw_set_font(-1);
	draw_set_halign(-1);
}
