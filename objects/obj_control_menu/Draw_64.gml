if(room == rm_game_over) 
{
	draw_set_halign(fa_right);
	draw_text(820, 20, "Record: " + string(round(global.record / 60)));
	draw_set_halign(-1);
}

if(room == rm_menu) 
{
	draw_set_font(fnt_menu_2);
	draw_text(3, room_height+100, "Jogo feito para a NoneJam 13");

	draw_text(3, room_height, "Use 'A' e 'D' ou as setas para se mover");
	draw_text(3, room_height+20, "Use 'W', espaço ou seta para cima para pular");
	draw_text(3, room_height+40, "Mire e atire com o mouse");
	draw_text(3, room_height+60, "Perderá se suas vidas ou fome chegarem a 0");
	draw_text(3, room_height+80, "Coma apertando 'E' nas árvores futíferas");
	draw_set_font(-1);
}


if(room == rm_game_over)
{	
	draw_set_font(fnt_menu);
	draw_set_halign(fa_center);
	var _x = display_get_gui_width() / 2;
	draw_text(_x, 95, global.game_over_txt);
	draw_set_font(-1);
	draw_set_halign(-1);
}