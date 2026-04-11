if (delay_timer > 0) {
    delay_timer--;

    if (delay_timer == 0) {
        spawn_enemy();
    }
}