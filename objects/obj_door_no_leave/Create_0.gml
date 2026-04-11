// Inherit the parent event
event_inherited();
interaction_text = "[E / Enter] Open Door";

blocked = false;

// Default interaction function
do_interact = function(_player)
{
    if(_player.has_blue_key) {
        show_debug_message("Interacted with BLUE: " + string(object_get_name(object_index)));
        room_goto(House1)
    } else if (blocked) {
        interaction_text = "The door is locked!";
    } else {
        interaction_text = "I have no reason to leave.";
    }
};
