is_paused = false;
menu_state = "main"; 
button_array = [];
current_index = 0;

is_using_mouse = false;
prev_mouse_x = device_mouse_x_to_gui(0);
prev_mouse_y = device_mouse_y_to_gui(0);

developers = ["Alexander Doubrava", "Simon Weisser", "Nikyar Karmimi", "Haris Kurtagic"];

spawn_main_buttons = function() {
    menu_state = "main";
    current_index = 0;
    
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
    var _start_x = _gui_w / 2;
    var _start_y = (_gui_h / 2) - 50;
    var _spacing = 80;
    
    // Create buttons on the "Instances_1" layer or a dedicated UI layer
    button_array[0] = instance_create_layer(_start_x, _start_y, "Instances_1", obj_btn_parent);
    button_array[0].button_text = "ENTWICKLER";
    button_array[0].button_action = function() { 
        with(obj_pause_menu_manager) { spawn_credits_buttons(); }
    };
    
    button_array[1] = instance_create_layer(_start_x, _start_y + _spacing, "Instances_1", obj_btn_parent);
    button_array[1].button_text = "HAUPTMENÜ";
    button_array[1].button_action = function() { 
        instance_activate_all();
        is_paused = false;
        room_goto(Room_Main_Menu); 
    };

    button_array[2] = instance_create_layer(_start_x, _start_y + (_spacing * 2), "Instances_1", obj_btn_parent);
    button_array[2].button_text = "BEENDEN";
    button_array[2].button_action = function() { game_end(); };
    
    // Einheitliche Größe erzwingen
    draw_set_font(global.fnt_menu);
    var _max_w = 0, _max_h = 0;
    for (var i = 0; i < array_length(button_array); i++) {
        var _w = string_width(button_array[i].button_text);
        var _h = string_height(button_array[i].button_text);
        if (_w > _max_w) _max_w = _w;
        if (_h > _max_h) _max_h = _h;
    }
    for (var i = 0; i < array_length(button_array); i++) {
        button_array[i].image_xscale = (_max_w + 40) / sprite_get_width(button_array[i].sprite_index);
        button_array[i].image_yscale = (_max_h + 20) / sprite_get_height(button_array[i].sprite_index);
    }
}

// ==========================================
// FUNKTION 2: ENTWICKLER-MENÜ ERSCHAFFEN
// ==========================================
spawn_credits_buttons = function() {
    // 1. Alte Buttons löschen
    for (var i = 0; i < array_length(button_array); i++) instance_destroy(button_array[i]);
    button_array = [];
    
    menu_state = "credits";
    current_index = 0;
	
	var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
    var _start_x = _gui_w / 2;
    var _start_y = (_gui_h / 2) + 120;
    var _spacing = 80;
    
    // Nur ein einziger Button: Zurück
    button_array[0] = instance_create_layer(_start_x, _start_y, "Instances_1", obj_btn_parent);
    button_array[0].button_text = "ZURÜCK";
    button_array[0].button_action = function() {
        // Alte Buttons löschen und zurück ins Hauptmenü
        for (var i = 0; i < array_length(button_array); i++) instance_destroy(button_array[i]);
        with(obj_pause_menu_manager) { spawn_main_buttons(); } 
    };
    
    // Größe anpassen
    draw_set_font(global.fnt_menu);
    var _base_w = sprite_get_width(button_array[0].sprite_index);
    var _base_h = sprite_get_height(button_array[0].sprite_index);
    button_array[0].image_xscale = (string_width("ZURÜCK") + 40) / _base_w;
    button_array[0].image_yscale = (string_height("ZURÜCK") + 20) / _base_h;
}