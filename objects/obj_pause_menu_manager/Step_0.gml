var _gui_mouse_x = device_mouse_x_to_gui(0);
var _gui_mouse_y = device_mouse_y_to_gui(0);

// ==========================================
// TEIL 1: PAUSE EIN- UND AUSSCHALTEN
// ==========================================
if (keyboard_check_pressed(vk_escape)) {
    is_paused = !is_paused;
	global.game_paused = is_paused;
    
    if (is_paused) {
        // ZUERST deactivieren, DANN buttons erschaffen
        spawn_main_buttons(); 
    } else {
        for (var i = 0; i < array_length(button_array); i++) {
            if (instance_exists(button_array[i])) instance_destroy(button_array[i]);
        }
        button_array = []; 
        menu_state = "main";
    }
}

// ==========================================
// TEIL 2: MENÜ-STEUERUNG (Nur wenn pausiert)
// ==========================================
if (is_paused && array_length(button_array) > 0) {
    var _move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
    var _mouse_moved = (_gui_mouse_x != prev_mouse_x || _gui_mouse_y != prev_mouse_y);

    if (_mouse_moved) is_using_mouse = true;
    if (_move != 0 || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) is_using_mouse = false;

    if (_move != 0) {
        if (instance_exists(button_array[current_index])) button_array[current_index].is_selected = false;
        current_index += _move;
        if (current_index < 0) current_index = array_length(button_array) - 1;
        if (current_index >= array_length(button_array)) current_index = 0;
    }

    if (is_using_mouse) {
        for (var i = 0; i < array_length(button_array); i++) {
            if (instance_exists(button_array[i])) {
                button_array[i].is_selected = false;
            }
        }
    } else {
        if (instance_exists(button_array[current_index])) {
            button_array[current_index].is_selected = true;
        }
    }
}

prev_mouse_x = _gui_mouse_x;
prev_mouse_y = _gui_mouse_y;