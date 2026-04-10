function get_swapped_tileset(_current, _is_night) {
    var name = asset_get_name(_current);

    if (_is_night) {
        // go to night
        if (!string_ends_with(name, "_night")) {
            name += "_night";
        }
    } else {
        // go to day
        if (string_ends_with(name, "_night")) {
            name = string_delete(name, string_length(name) - 5, 6);
        }
    }

    if (variable_struct_exists(tileset_map, name)) {
        return tileset_map[$ name];
    }

    return _current; // fallback if not found
}