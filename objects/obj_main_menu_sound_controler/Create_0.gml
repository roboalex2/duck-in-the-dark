// Create Event: obj_main_menu_sound_controler
audio_play_sound(sou_start_menu, 10, true);

// Use this to get the volume of the specific sound asset
_volume = audio_sound_get_gain(sou_start_menu); 

// OR, if you want the global master volume:
// _volume = audio_get_master_gain(0);