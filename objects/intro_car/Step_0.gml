if (path_position > 0.3) {
    sprite_index = blue_wagon_12Uhr;
}
if (path_position > 0.5) {
	sprite_index = blue_wagon;
}

var enterPressed = keyboard_check_pressed(ord(" "))

if (enterPressed == true) {
	path_position = 1;
}