is_active = false;
action_queue = []; 
current_action = undefined;
portrait_sprite = noone; // NEU: Speichert das Profilbild

display_text = "";
char_index = 0;
show_continue_icon = false;

margin = 20;            
box_height = 120;
portrait_width = 100; // NEU: Platz für das Profilbild

add_action = function(_type, _data) {
    array_push(action_queue, { type: _type, data: _data });
}

next_action = function() {
    is_active = true;
    global.game_paused = true;
    if (array_length(action_queue) > 0) {
        current_action = array_shift(action_queue);
        if (current_action.type == "text") {
            char_index = 0;
            display_text = "";
        } else if (current_action.type == "code") {
            current_action.data();
            next_action();         
        }
    } else {
        is_active = false;
        current_action = undefined;
        portrait_sprite = noone; // Reset
        global.game_paused = false; 
    }
}