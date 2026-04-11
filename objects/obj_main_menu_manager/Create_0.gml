global.fnt_menu = font_add("Fonts/Kenney_Block.ttf", 24, false, false, 32, 128)

draw_set_font(global.fnt_menu)

// Start coordinate for the top button
var _start_x = room_width / 2;
var _start_y = room_height / 2;
var _spacing = 80; // Space between buttons
// Track previous mouse positions
prev_mouse_x = mouse_x;
prev_mouse_y = mouse_y;

// Create the buttons and store their unique IDs in an array
button_array = [];

// Button 1: Start
button_array[0] = instance_create_layer(_start_x, _start_y, "Instances_1", obj_btn_parent);
button_array[0].button_text = "START";
button_array[0].button_action = function() { room_goto(Room2); };

// Button 2: Quit
button_array[1] = instance_create_layer(_start_x, _start_y + _spacing, "Instances_1", obj_btn_parent);
button_array[1].button_text = "Beenden";
button_array[1].button_action = function() { game_end(); };

// Track which button is highlighted by the keyboard
current_index = 0;
is_using_mouse = false; // Speichert, ob wir gerade im "Maus-Modus" sind