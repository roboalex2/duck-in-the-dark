// --- DRAW GUI EVENT ---
if (is_paused) {
    // 1. Bildschirmgröße (GUI) abfragen statt Kamera!
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();

    // 2. Halftransparentes Schwarz über den GANZEN Bildschirm
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false); // Startet immer fix bei 0,0
    draw_set_alpha(1.0);

    // 3. ENTWICKLER-NAMEN ZEICHNEN
    if (menu_state == "credits") {
        draw_set_font(global.fnt_menu); 
        draw_set_halign(fa_center);     
        draw_set_valign(fa_middle);
        draw_set_color(c_white);        
        
        var _center_x = _gui_w / 2;
        var _start_y = (_gui_h / 2) - 80; 
        var _spacing = 40; 
        
        draw_text(_center_x, _start_y - 60, "--- ENTWICKLER ---");
        
        for (var i = 0; i < array_length(developers); i++) {
            draw_text(_center_x, _start_y + (i * _spacing), developers[i]);
        }
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}