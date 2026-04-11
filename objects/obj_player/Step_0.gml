
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var _len = point_distance(0, 0, _hor, _ver);
if (_len > 0) {
    _hor /= _len;
    _ver /= _len;
}

if (global.game_paused) {
    _hor = 0;
    _ver = 0;
}

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap);

