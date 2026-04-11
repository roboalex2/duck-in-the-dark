if (!is_active || current_action == undefined) exit;

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _tile_size = 16;

// 1. Box zeichnen
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(margin, _gui_h - box_height - margin, _gui_w - margin, _gui_h - margin, false);
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_rectangle(margin, _gui_h - box_height - margin, _gui_w - margin, _gui_h - margin, true);

// 2. Profilbild (Portrait) zeichnen
var _p_x = margin +64;
var _p_y = _gui_h - box_height * 2 + margin + 64;
if (portrait_sprite != noone) {
    // Zeichnet das aktuelle Sprite des NPCs (inkl. Animation)
    // Wir skalieren es passend für die Box
    var _scale = (box_height) / sprite_get_height(portrait_sprite);
    draw_sprite_ext(portrait_sprite, (current_time / 100) % sprite_get_number(portrait_sprite), _p_x, _p_y + (box_height/2), _scale, _scale, 0, c_white, 1);
}

// 3. Text zeichnen (nach rechts verschoben durch portrait_width)
draw_set_font(global.fnt_menu); 
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _text_x = margin + portrait_width + 20;
draw_text_ext(_text_x, _gui_h - box_height, display_text, 30, _gui_w - _text_x - margin - 20);

// 3. Icons unten rechts zeichnen
var _icon_x = _gui_w - (margin * 3);
var _icon_y = _gui_h - (margin * 3);

draw_set_valign(fa_middle);
draw_set_halign(fa_right);

if (!show_continue_icon) {
    // Während der Text getippt wird:
    
    // ENTER-Icon (Ueberspringen)
    var _ent_pressing = keyboard_check(vk_enter);
    var _ent_col = 32;
    var _ent_row = _ent_pressing ? 10 : 2;
    draw_sprite_part_ext(spr_prompt_input, 0, _ent_col * _tile_size, _ent_row * _tile_size, _tile_size * 2, _tile_size *2, _icon_x, _icon_y, 1, 1, c_white, 1);
    draw_text(_icon_x - 5, _icon_y + 8, "Skip");

    // E-Icon (Schneller) leicht darüber versetzt
    var _e_pressing = keyboard_check(ord("E"));
    var _e_col = 19;
    var _e_row = _e_pressing ? 10 : 2;
    var _e_y = _icon_y - 30;
    draw_sprite_part_ext(spr_prompt_input, 0, _e_col * _tile_size, _e_row * _tile_size, _tile_size, _tile_size, _icon_x + 8, _e_y, 2, 2, c_white, 1);
    draw_text(_icon_x - 5, _e_y + 8, "Fast Forward");

} else {
    // Wenn der Text fertig ist:
    
    // ENTER-Icon (Weiter)
    var _ent_pressing = keyboard_check(vk_enter);
    var _ent_col = 32;
    var _ent_row = _ent_pressing ? 10 : 2;
    draw_sprite_part_ext(spr_prompt_input, 0, _ent_col * _tile_size, _ent_row * _tile_size, _tile_size * 2, _tile_size *2, _icon_x, _icon_y, 1, 1, c_white, 1);
    draw_text(_icon_x - 10, _icon_y + 8, "Next");
}