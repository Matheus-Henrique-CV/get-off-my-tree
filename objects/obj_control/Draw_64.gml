draw_set_halign(fa_right);

draw_text(820, 20, "Pontos: " + string(round(global.points / 60)));
draw_text(820, 40, "Record: " + string(round(global.record / 60)));

draw_set_halign(-1);