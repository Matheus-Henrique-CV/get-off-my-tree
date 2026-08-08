draw_self();

draw_set_font(fnt_menu);
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_text_transformed(x, y, text, image_xscale, image_yscale, image_angle);
draw_set_font(-1);
draw_set_valign(-1);
draw_set_halign(-1);