// Inherit the parent event
event_inherited();
opened = false;
interaction_text = "[E / Enter]  Talk";
interaction_range = 48;

do_interact = function(_player)
{ 
    if(opened) return;
    opened = true;
    interaction_text = "";
    if (instance_exists(obj_dialogue_manager)) {
        if (obj_dialogue_manager.is_active) exit; 
    } else {
        instance_create_depth(0, 0, -10000, obj_dialogue_manager);
    }
    
    with (obj_dialogue_manager) {
        portrait_sprite = nikyar_s;
        add_action("text", "Hello Travler! Welcome to my humble Gasstation! How may I help you?");
        
        add_action("code", function() {
                obj_dialogue_manager.portrait_sprite = steve_s;
        });
        add_action("text", "Hi, it seems my car broke down. Hopefully just an oil change... Do you know someone?");
        
        add_action("code", function() {
            obj_dialogue_manager.portrait_sprite = nikyar_s;
        });
        add_action("text", "Oh. Ohhh.. How... delightful.�");
        
        add_action("code", function() {
                obj_dialogue_manager.portrait_sprite = steve_s;
        });
        add_action("text", "What..?");
        
        add_action("code", function() {
            obj_dialogue_manager.portrait_sprite = nikyar_s;
        });
        add_action("text", "*door clicks*");

        add_action("code", function() { 
            with (obj_tank) {
                instance_create_layer(x, y, "Instances", obj_enemy); 
                instance_create_layer(x, y, "Instances", obj_key_blue); 
                instance_destroy(); 
            }
            with (obj_door_no_leave) {
                blocked = true;
                interaction_text = "The door is locked!";
            }
            with (obj_enemy) {
                tilemap = layer_tilemap_get_id("none");
                captured = function () {
                    global.game_paused = true;
                    with (obj_player) {
                        is_dead = true;
                    }
                    with (obj_dialogue_manager) {
                        portrait_sprite = nikyar_s;
                        add_action("text", "Ohh.. What luck to receive a sacrifice for free!");
                        add_action("code", function() {
                             room_goto(Room1);
                        });
                        next_action();
                    }
                }
            }
        });
        
        next_action();
    }
};