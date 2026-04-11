// Inherit the parent event
event_inherited();
interaction_text = "[E / Enter] Collect Key";


// Default interaction function
do_interact = function(_player)
{
    if(!_player.has_blue_key) {
        _player.has_blue_key = true;
        show_debug_message("Interacted with: " + string(object_get_name(object_index)));
    }
    instance_destroy();
};
