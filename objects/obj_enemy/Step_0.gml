// Player reference
_has_player = instance_exists(obj_player);
_player_dist = 999999;
_player = noone;

if (_has_player) {
    _player = instance_find(obj_player, 0);
    _player_dist = point_distance(x, y, _player.x, _player.y);
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
if (is_chasing && _has_player) {
    enemy_move_chase(_player, chase_speed);
}
else {
    enemy_move_wander(move_speed);
}
