/// @description Audio Controller - Initialize background music
// This object handles the background music for the game
// Plays the background music in a loop at 80% volume

// Play background music on loop (priority 0, loop = true)
audio_play_sound(snd_background_music, 0, true);
// Set volume to 80% (gain = 0.8, fade time = 0)
audio_sound_gain(snd_background_music, 0.8, 0);