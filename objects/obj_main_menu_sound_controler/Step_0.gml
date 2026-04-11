

function pause_music() {
	show_debug_message(_volume)
	audio_sound_gain(sou_start_menu, _volume);
	audio_sound_gain(sou_start_menu, 0, 2000);
	audio_pause_sound(sou_start_menu);
};

function resume_music() {
	show_debug_message(_volume)
	audio_sound_gain(sou_start_menu, 0);
	audio_sound_gain(sou_start_menu, _volume, 2000);
	audio_resume_sound(sou_start_menu);
};

function stop_music() {
	audio_sound_gain(sou_start_menu, _volume);
	audio_sound_gain(sou_start_menu, 0, 2000);
	audio_stop_sound(sou_start_menu);
};