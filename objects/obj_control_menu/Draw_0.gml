
if(room == rm_menu) 
{
	draw_set_font(fnt_menu);
	draw_text_transformed(3, room_height-20, "Jogo feito para a NoneJam 13", 0.3, 0.3, 0);

	draw_text_transformed(3, room_height-120, "Use 'A' e 'D' ou as setas para se mover", 0.3, 0.3, 0);
	draw_text_transformed(3, room_height-100, "Use 'W', espaço ou seta para cima para pular", 0.3, 0.3, 0);
	draw_text_transformed(3, room_height-80, "Mire e atire com o mouse", 0.3, 0.3, 0);
	draw_text_transformed(3, room_height-60, "Perde se suas vidas ou fome chegarem a 0", 0.3, 0.3, 0);
	draw_text_transformed(3, room_height-40, "Coma apertando 'E' nas plantas frutíferas", 0.3, 0.3, 0);
	draw_set_font(-1);
}


if(room == rm_game_over)
{
	draw_set_font(fnt_menu);
	draw_set_halign(fa_center);
	draw_text(room_width/2, 75, global.game_over_txt);
	draw_set_font(-1);
	draw_set_halign(-1);
}
