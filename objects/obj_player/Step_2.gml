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


// Interaction scan
interact_target = noone;
show_interact_prompt = false;
interact_prompt_text = "Interact";

var _list = ds_list_create();

var _count = collision_circle_list(
    x, y,
    interact_range,
    par_interactable,
    false,
    true,
    _list,
    true
);

var _best = noone;
var _best_dist = 999999;

for (var i = 0; i < _count; i++)
{
    var _inst = _list[| i];

    if (instance_exists(_inst) && _inst.interactable)
    {
        var _dist = point_distance(x, y, _inst.x, _inst.y);

        if (_dist <= _inst.interaction_range && _dist < _best_dist)
        {
            _best_dist = _dist;
            _best = _inst;
        }
    }
}

ds_list_destroy(_list);

if (_best != noone)
{
    interact_target = _best;
    show_interact_prompt = true;
    interact_prompt_text = _best.interaction_text;
}

// Press E or Enter
var _interact_pressed = keyboard_check_pressed(ord("E"))
                     || keyboard_check_pressed(vk_enter);

if (show_interact_prompt && _interact_pressed)
{
    if (instance_exists(interact_target) && variable_instance_exists(interact_target, "do_interact"))
    {
        interact_target.do_interact(id);
    }
}