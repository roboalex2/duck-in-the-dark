// Inherit the parent event
event_inherited();
interaction_text = "[E / Enter] Collect Key";
interactable = false;
delay_timer = -1;

// Somewhere in code
delay_timer = room_speed * 0.5;


// Default interaction function
do_interact = function(_player)
{
    if(!_player.has_blue_key) {
        _player.has_blue_key = true;
        show_debug_message("Interacted with: " + string(object_get_name(object_index)));
        with (obj_door_blue) {
            interaction_text = "[E / Enter] Open Door";
        }
        with (obj_door_no_leave) {
            interaction_text = "[E / Enter] Open Door";
        }
    }
    instance_destroy();
};
