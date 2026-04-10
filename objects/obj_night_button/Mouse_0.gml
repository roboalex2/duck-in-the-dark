is_night = !is_night;

var tileset_to_use = is_night ? ts_night : ts_day;

for (var i = 0; i < array_length(tile_layers); i++) {
    var layer_name = tile_layers[i];
    var tilemap_id = layer_tilemap_get_id(layer_name);
    
    if (tilemap_id != -1) {
        tilemap_set_tileset(tilemap_id, tileset_to_use);
    }
}