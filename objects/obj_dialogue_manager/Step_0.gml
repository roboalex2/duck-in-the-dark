if (!is_active || current_action == undefined) exit;

if (current_action.type == "text") {
    var _text = current_action.data;
    
    // E-Taste für Beschleunigung (Speed Up)
    var _is_speeding = keyboard_check(ord("E"));
    var _speed = _is_speeding ? 4 : 0.5; // Geschwindigkeit bei E erhöht

    if (char_index < string_length(_text)) {
        // Text läuft noch
        char_index += _speed;
        display_text = string_copy(_text, 1, floor(char_index));
        show_continue_icon = false;
        
        // ENTER überspringt den Text sofort
        if (keyboard_check_pressed(vk_enter)) {
            char_index = string_length(_text);
            display_text = _text;
        }
    } else {
        // Text ist vollständig angezeigt
        show_continue_icon = true;
        
        // ENTER geht zur nächsten Aktion
        if (keyboard_check_pressed(vk_enter)) {
            next_action();
        }
    }
}