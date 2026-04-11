// 1. Scale the object based on text (Keep your existing scaling logic)
var _text_w = string_width(button_text);
var _text_h = string_height(button_text);
var _padding_x = 40;
var _padding_y = 20;
var _base_w = sprite_get_width(sprite_index);
var _base_h = sprite_get_height(sprite_index);

image_xscale = (_text_w + _padding_x) / _base_w;
image_yscale = (_text_h + _padding_y) / _base_h;

// 2. USE GUI MOUSE COORDINATES FOR INTERACTION
var _gui_x = device_mouse_x_to_gui(0);
var _gui_y = device_mouse_y_to_gui(0);

// Check if the mouse is touching this specific button on the GUI layer
is_hovering = position_meeting(_gui_x, _gui_y, id);

if (is_hovering) {
    if (mouse_check_button(mb_left)) {
        sprite_index = sprite_click;
    } else {
        sprite_index = sprite_hover;
    }
    
    if (mouse_check_button_released(mb_left) && button_action != -1) {
        button_action();
    }
} else {
    if (is_selected) {
        if (keyboard_check(vk_enter) || keyboard_check(vk_space)) {
            sprite_index = sprite_click;
        } else {
            sprite_index = sprite_hover;
        }
        
        if ((keyboard_check_released(vk_enter) || keyboard_check_released(vk_space)) && button_action != -1) {
            button_action();
        }
    } else {
        sprite_index = sprite_idle;
    }
}