// Movement values actually used for animation
var _anim_hor = 0.0;
var _anim_ver = 0.0;


// Use actual movement for animation
_anim_hor = x - xprevious;
_anim_ver = y - yprevious;

// Small improvement:
// if stuck while wandering, force a new direction next step
if (!is_chasing) {
    if (abs(_anim_hor) < 0.01 && abs(_anim_ver) < 0.01) {
        wander_time = 0;
    }
}

// Sprite selection
if (_anim_hor != 0 || _anim_ver != 0) {
    sprite_index = get_enemy_sprite(_anim_hor, _anim_ver);
    image_speed = walk_anim_speed;
}
else {
    sprite_index = get_enemy_sprite(_anim_hor, _anim_ver);
    image_speed = 0;
    image_index = 0;
}