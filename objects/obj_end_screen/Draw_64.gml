// Set the alignment so the text is perfectly centered
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Set the font and color
draw_set_font(global.fnt_menu);
draw_set_color(c_white);

// Draw the text in the middle of the GUI layer
draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "GAME OVER");

// Reset alignment (important so other text doesn't break!)
draw_set_halign(fa_left);
draw_set_valign(fa_top);