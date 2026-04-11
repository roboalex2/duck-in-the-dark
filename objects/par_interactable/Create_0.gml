interactable = true;
interaction_range = 32;
interaction_text = "Interact";

// Default interaction function
do_interact = function(_player)
{
    show_debug_message("Interacted with: " + string(object_get_name(object_index)));
};

