global.toggeled_switched = 0;
// Inherit the parent event
event_inherited();

interactable = true;
interaction_range = 48;
interaction_text = "[E / Enter] Toggle Switch";

image_speed = 0;     // stop animation
image_index = 0;     // start at first frame

is_activated = false;

// Default interaction function
do_interact = function(_player)
{
   
    if (!is_activated) {
        is_activated = true;
        interaction_text = "Already toggeled";
        image_speed = 1;
        global.toggeled_switched = global.toggeled_switched + 1;
    }
    
    if (global.toggeled_switched >= 3) {
        global.game_paused = true;
        with (obj_night_button) {
            is_night = false;
            update();
        }
        
        
        with (obj_dialogue_manager) {
            portrait_sprite = steve_s;
            add_action("text", "I have WON!!!");
            add_action("code", function() {
               room_goto(Room_End_Screen_Normal)
             });
            next_action();
        }
    }
};



