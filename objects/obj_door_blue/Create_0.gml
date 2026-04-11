// Inherit the parent event
event_inherited();
interaction_text = "Open Door";


// Default interaction function
do_interact = function(_player)
{
    if(_player.has_blue_key) {
        show_debug_message("Interacted with BLUE: " + string(object_get_name(object_index)));
    } else {
        
    }
};
