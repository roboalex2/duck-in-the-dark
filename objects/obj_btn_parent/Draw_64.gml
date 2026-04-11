
draw_self(); // Draws the stretched box

draw_set_font(global.fnt_menu); // Replace with your actual font!
draw_set_halign(fa_center); // Centers text horizontally
draw_set_valign(fa_middle); // Centers text vertically
draw_set_color(c_white);

// Because the origin is Middle Center, x and y are the exact center of the box!
draw_text(x, y, button_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);