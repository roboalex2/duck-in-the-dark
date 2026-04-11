// Night mode
var _is_night = false;
if (instance_exists(obj_night_button)) {
    _is_night = instance_find(obj_night_button, 0).is_night;
}

// Player reference
var _has_player = instance_exists(obj_player);
var _player_dist = 999999;

if (_has_player) {
    _player_dist = point_distance(x, y, obj_player.x, obj_player.y);
}

// State switching
if (!is_chasing && _has_player && _player_dist <= detect_range) {
    is_chasing = true;
    path_end();
}
else if (is_chasing && (!_has_player || _player_dist > lose_range)) {
    is_chasing = false;
    patrol_started = false;
}


// Patrol or chase
var _hor = 0;
var _ver = 0;

if (is_chasing && _has_player) {
    // Chase player manually
    _hor = sign(obj_player.x - x);
    _ver = sign(obj_player.y - y);

    var _len = point_distance(0, 0, _hor, _ver);
    if (_len > 0) {
        _hor /= _len;
        _ver /= _len;
    }

    move_and_collide(_hor * chase_speed, _ver * chase_speed, tilemap);
}
else {
    // Start / resume patrol path
    if (!patrol_started) {
        path_start(patrol_path, patrol_speed, path_action_reverse, false);
        patrol_started = true;
    }

    // Approximate movement direction while on path
    _hor = sign(x - xprevious);
    _ver = sign(y - yprevious);
}


// Update facing
if (abs(_ver) > abs(_hor)) {
    if (_ver > 0) facing = 0;      // down
    else if (_ver < 0) facing = 1; // up
}
else if (abs(_hor) > 0) {
    if (_hor > 0) facing = 2;      // right
    else if (_hor < 0) facing = 3; // left
}


// Sprite selection
switch (facing) {
    case 0: sprite_index = _is_night ? enemy_s_night : nikyar_s; break;
    case 1: sprite_index = _is_night ? enemy_w_night : nikyar_w; break;
    case 2: sprite_index = _is_night ? enemy_d_night : nikyar_d; break;
    case 3: sprite_index = _is_night ? enemy_a_night : nikyar_a; break;
}


// Animate only while moving
var _is_moving = (abs(x - xprevious) > 0 || abs(y - yprevious) > 0);

if (_is_moving) {
    image_speed = walk_anim_speed;
}
else {
    image_speed = 0;
    image_index = 0;
}