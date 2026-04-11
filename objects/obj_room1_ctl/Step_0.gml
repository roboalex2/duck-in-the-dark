if (delay_timer > 0) {
    delay_timer--;
    global.game_paused = true;
    if (delay_timer == 0) {
        startDialog();
    }
}