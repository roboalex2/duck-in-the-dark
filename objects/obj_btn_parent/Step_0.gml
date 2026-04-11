// 1. Set the font FIRST so GameMaker measures the right size
// REPLACE 'fnt_menu' with the actual name of your font!


// 2. Measure the text
var _text_w = string_width(button_text);
var _text_h = string_height(button_text);

// 3. Define some padding (extra space around the text)
var _padding_x = 40; // 20 pixels on left, 20 on right
var _padding_y = 20; // 10 pixels on top, 10 on bottom

// 4. Get the original, un-stretched size of the current sprite
var _base_w = sprite_get_width(sprite_index);
var _base_h = sprite_get_height(sprite_index);

// 5. Scale the object!
image_xscale = (_text_w + _padding_x) / _base_w;
image_yscale = (_text_h + _padding_y) / _base_h;

// 1. Check if the mouse is touching this specific button
is_hovering = position_meeting(mouse_x, mouse_y, id);

if (is_hovering) {
    // --- MOUSE LOGIC ---
    if (mouse_check_button(mb_left)) {
        sprite_index = sprite_click; // Mouse is holding down on it
    } else {
        sprite_index = sprite_hover; // Mouse is just resting on it
    }
    
    // Execute action when mouse is released
    if (mouse_check_button_released(mb_left) && button_action != -1) {
        button_action(); 
    }
    
} else {
    // --- KEYBOARD/MANAGER LOGIC ---
    // If the mouse isn't on it, check if the manager says it's selected via keyboard
    if (is_selected) {
        
        if (keyboard_check(vk_enter) || keyboard_check(vk_space)) {
            sprite_index = sprite_click; // Holding Enter/Space
        } else {
            sprite_index = sprite_hover; // Highlighted by keyboard
        }
        
        // Execute action when Enter/Space is released
        if ((keyboard_check_released(vk_enter) || keyboard_check_released(vk_space)) && button_action != -1) {
            button_action();
        }
        
    } else {
        // --- IDLE LOGIC ---
        // Neither mouse nor keyboard is interacting with it
        sprite_index = sprite_idle;
    }
}