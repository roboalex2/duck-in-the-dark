

var _is_night = false;

if (instance_exists(obj_night_button)) {
    var _night_button = instance_find(obj_night_button, 0);
    _is_night = _night_button.is_night;
}

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var _len = point_distance(0, 0, _hor, _ver);
if (_len > 0) {
    _hor /= _len;
    _ver /= _len;
}

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap);


// Animation
if (_hor != 0 || _ver != 0)
{
    sprite_index = get_player_sprite(_hor, _ver, _is_night);
    image_speed = walk_anim_speed;
}
else
{
    image_speed = 0;
    image_index = 0;
}