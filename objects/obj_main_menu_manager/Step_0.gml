// 1. Inputs abfragen
var _move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
var _mouse_moved = (mouse_x != prev_mouse_x || mouse_y != prev_mouse_y);

// 2. Modus wechseln (Wer hat gerade die Kontrolle?)
if (_mouse_moved) {
    is_using_mouse = true; // Maus übernimmt
}
if (_move != 0 || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    is_using_mouse = false; // Tastatur übernimmt
}

// 3. Tastatur-Navigation (Index bewegen)
if (_move != 0) {
    // Alte Auswahl ausschalten
    button_array[current_index].is_selected = false;
    
    // Index verschieben
    current_index += _move;
    
    // Wrap around logic (looping menu)
    if (current_index < 0) current_index = array_length(button_array) - 1;
    if (current_index >= array_length(button_array)) current_index = 0;
}

// 4. Visuellen Status anwenden (Der Flacker-Fix!)
if (is_using_mouse) {
    // Wenn die Maus benutzt wird, schalte alle Tastatur-Markierungen aus
    for (var i = 0; i < array_length(button_array); i++) {
        button_array[i].is_selected = false;
    }
} else {
    // Wenn die Tastatur benutzt wird, erzwinge die Markierung auf dem aktuellen Button
    button_array[current_index].is_selected = true;
}

// THIS MUST BE AT THE VERY END OF THE STEP EVENT
// Update the previous mouse coordinates for the next frame
prev_mouse_x = mouse_x;
prev_mouse_y = mouse_y;