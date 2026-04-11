// Movement
move_speed = 0.7;
chase_speed = 0.8;
walk_anim_speed = 1;

// Detection
detect_range = 100;
lose_range = 140;

// State
is_chasing = false;
friendly = false;

// Facing: 0 = down, 1 = up, 2 = right, 3 = left
facing = 0;

// Collision tilemap
tilemap = layer_tilemap_get_id("collision");

// Wander movement
wander_dir_x = 0;
wander_dir_y = 1;
wander_time = 0;

global.game_paused = false;

captured = function () {
     room_goto(Room_End_Screen_Cursed);
}

// Start sprite
sprite_index = nikyar_s;
image_speed = 0;
image_index = 0;

function get_enemy_sprite(_hor, _ver)
{
    var _is_night = false;
    if (instance_exists(obj_night_button)) {
        _is_night = instance_find(obj_night_button, 0).is_night;
    }
    
    
    var _dir = "s";

    
    if (_ver < 0) _dir = "w";
    else if (_hor > 0) _dir = "d";
    else if (_hor < 0) _dir = "a"; 
    else if (_ver > 0) _dir = "s";

    switch (_dir)
    {
        case "w": return _is_night ? enemy_w_night : nikyar_w;
        case "d": return _is_night ? enemy_d_night : nikyar_d;
        case "a": return _is_night ? enemy_a_night : nikyar_a;
        case "s": return _is_night ? enemy_s_night : nikyar_s;
    }

    return _is_night ? enemy_s_night : nikyar_s;
}

function enemy_move_chase(_player, _speed)
{
    var _dx = _player.x - x;
    var _dy = _player.y - y;

    var _hor = 0;
    var _ver = 0;

    if (abs(_dx) > 2) {
        _hor = sign(_dx);
    }

    if (abs(_dy) > 2) {
        _ver = sign(_dy);
    }

    var _len = point_distance(0, 0, _hor, _ver);
    if (_len > 0) {
        _hor /= _len;
        _ver /= _len;
    }
    
    if (global.game_paused) {
        _hor = 0;
        _ver = 0;
    }

    move_and_collide(_hor * _speed, _ver * _speed, tilemap);
    x = clamp(x, 1, room_width);
    y = clamp(y, 1, room_height);
}

function enemy_choose_wander_direction()
{
    var _choice = irandom(8);

    switch (_choice) {
        case 0: wander_dir_x =  0; wander_dir_y =  0; break; // stand still
        case 1: wander_dir_x =  1; wander_dir_y =  0; break; // right
        case 2: wander_dir_x = -1; wander_dir_y =  0; break; // left
        case 3: wander_dir_x =  0; wander_dir_y =  1; break; // down
        case 4: wander_dir_x =  0; wander_dir_y = -1; break; // up
        case 5: wander_dir_x =  1; wander_dir_y =  1; break; // down-right
        case 6: wander_dir_x = -1; wander_dir_y =  1; break; // down-left
        case 7: wander_dir_x =  1; wander_dir_y = -1; break; // up-right
        case 8: wander_dir_x = -1; wander_dir_y = -1; break; // up-left
    }

    var _len = point_distance(0, 0, wander_dir_x, wander_dir_y);
    if (_len > 0) {
        wander_dir_x /= _len;
        wander_dir_y /= _len;
    }

    wander_time = irandom_range(120, 300);
}

function enemy_move_wander(_speed)
{
    if (global.game_paused) {
       return;
    }
    
    if (wander_time <= 0) {
        enemy_choose_wander_direction();
    }

    wander_time--;

    move_and_collide(wander_dir_x * _speed, wander_dir_y * _speed, tilemap);
    x = clamp(x, 1, room_width);
    y = clamp(y, 1, room_height);
}