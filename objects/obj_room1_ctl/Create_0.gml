delay_timer = -1;

// Somewhere in code
delay_timer = room_speed * 3;

with (obj_night_button) {
    is_night = true;
    update();
}
global.game_paused = true;
with (obj_player) {
    is_dead = true;
}

function startDialog() {
    if (instance_exists(obj_dialogue_manager)) {
        if (obj_dialogue_manager.is_active) exit; 
    } else {
        instance_create_depth(0, 0, -10000, obj_dialogue_manager);
    }
    
    with (obj_dialogue_manager) {
        portrait_sprite = joker_d_night;
        add_action("text", "... Do you think we do not know you are awake?");
        
        add_action("code", function() {
                obj_dialogue_manager.portrait_sprite = enemy_a_night;
        });
        add_action("text", "They do... but do not struggle. You still have a chance to life. Our GOD requires a HUNT.");
        add_action("text", "This is the realm of eternal night. To escape you have to toggle 3 switches and return the day.");
        
        add_action("code", function() {
            obj_dialogue_manager.portrait_sprite = joker_d_night;
        });
        add_action("text", "Oh. Ohhh.. But its not that easy... We will hunt you. And if we capture you...");
        
        add_action("code", function() {
                obj_dialogue_manager.portrait_sprite = enemy_a_night;
        });
        add_action("text", "Then our GOD shall feast!");
        add_action("code", function() {
            global.game_paused = false;
            with (obj_player) {
                is_dead = false;
            }
        });
        next_action();
    }
        
}