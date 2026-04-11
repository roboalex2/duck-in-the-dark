is_night = !is_night;

for (var i = 0; i < array_length(layers); i++) {
    var layer_name = layers[i];
    var tilemap_id = layer_tilemap_get_id(layer_name);

    if (tilemap_id != -1) {
        var ts = tilemap_get_tileset(tilemap_id);
        var new_ts = ts;

        if (is_night) {
            if (ts == modern_suburb_tileset)       new_ts = modern_suburb_tileset_night;
            else if (ts == modern_suburb_houses)   new_ts = modern_suburb_houses_night;
            else if (ts == trees_tileset)          new_ts = trees_tileset_night;
            else if (ts == til_suburban_tileset)   new_ts = til_suburban_tileset_night;
			else if (ts == til_gas_station) new_ts = til_gas_station_night;
        } else {
            if (ts == modern_suburb_tileset_night)     new_ts = modern_suburb_tileset;
            else if (ts == modern_suburb_houses_night) new_ts = modern_suburb_houses;
            else if (ts == trees_tileset_night)        new_ts = trees_tileset;
			else if (ts == til_suburban_tileset_night) new_ts = til_suburban_tileset;
			else if (ts == til_gas_station_night) new_ts = til_gas_station;
        }

        tilemap_tileset(tilemap_id, new_ts);
    }
}