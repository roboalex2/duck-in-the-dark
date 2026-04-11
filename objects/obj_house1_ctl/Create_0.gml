// Create
delay_timer = -1;

// Somewhere in code
delay_timer = room_speed * 3;


function spawn_enemy() {
    instance_create_layer(x, y, "Instances", obj_enemy); 
    with (obj_enemy) {
        chase_speed = 1.1;
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
}