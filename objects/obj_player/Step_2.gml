// Use actual movement 
_anim_hor = x - xprevious;
_anim_ver = y - yprevious;


// Animation
if (_anim_hor != 0 || _anim_ver != 0)
{
    sprite_index = get_player_sprite(_anim_hor, _anim_ver);
    image_speed = walk_anim_speed;
}
else
{
    sprite_index = get_player_sprite(_anim_hor, _anim_ver);
    image_speed = 0;
    image_index = 0;
}