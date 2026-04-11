move_speed = 1;
walk_anim_speed = 1;

// Collision tilemap
tilemap = layer_tilemap_get_id("Obstacles");

// Night mode state
is_night = false;
night_controller = noone;

// Start with an idle sprite if you want
sprite_index = steve_s;
image_index = 0;
image_speed = 0;

gpu_set_texfilter(false);

function get_player_sprite(_hor, _ver)
{
    // Determine direction
    var _dir = "s";

        
    var _is_night = false;
    
    if (instance_exists(obj_night_button)) {
        var _night_button = instance_find(obj_night_button, 0);
        _is_night = _night_button.is_night;
    }
    
    if (_ver < 0) _dir = "w";
    else if (_hor > 0) _dir = "d";
    else if (_hor < 0) _dir = "a"; 
    else if (_ver > 0) _dir = "s";

    // Return sprite directly
    switch (_dir)
    {
        case "s": return _is_night ? steve_s_night : steve_s;
        case "w": return _is_night ? steve_w_night : steve_w;
        case "d": return _is_night ? steve_d_night : steve_d;
        case "a": return _is_night ? steve_a_night : steve_a;
    }

    // Fallback if no direction is pressed
    return _is_night ? steve_s_night : steve_s;
}
