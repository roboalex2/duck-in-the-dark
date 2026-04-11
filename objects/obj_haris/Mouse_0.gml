if (instance_exists(obj_dialogue_manager)) {
    if (obj_dialogue_manager.is_active) exit; 
} else {
    instance_create_depth(0, 0, -10000, obj_dialogue_manager);
}

var _my_sprite = sprite_index; // Das aktuelle Sprite des NPCs speichern

with (obj_dialogue_manager) {
    portrait_sprite = _my_sprite; // Automatische Referenz setzen

    add_action("text", "Hallo! Ich bin's. Schau in die Box links!");
    
    add_action("code", function() {
        with(obj_haris) { 
            sprite_index = alex_s; 
            image_index = 0;
            // Der Manager aktualisiert das Portrait automatisch, 
            // wenn wir portrait_sprite hier auch ändern:
            obj_dialogue_manager.portrait_sprite = sprite_index;
        }
    });

    add_action("text", "Mein Profilbild hat sich gerade mitgeändert.");
    next_action();
}