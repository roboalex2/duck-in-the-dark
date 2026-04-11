if (is_activated) {
    if (image_index >= image_number - 1) {
        image_index = image_number - 1; // clamp to last frame
        image_speed = 0;               // stop animation
    }
}