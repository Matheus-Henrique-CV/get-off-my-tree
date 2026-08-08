if(room == rm_game_over) 
{
	draw_set_halign(fa_right);
	draw_text(820, 20, "Record: " + string(round(global.record / 60)));
	draw_set_halign(-1);
}