if (ready == true) {
	visible = true;
    path_start(player_start_animation, 4, path_action_stop, true);
    ready = false; // Verhindert, dass der Pfad in jedem Frame neu startet
}

if (path_position > 0.9) {
	image_speed = 0;
}