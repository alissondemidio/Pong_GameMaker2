/// @description Start Button Object - Handle mouse click (start game)
// Mouse event for left button release (button 7)
// Starts the game when button is clicked

// Stop background music from menu
audio_stop_sound(snd_background_music);
// Reset game over flag
global.game_over = false;
// Transition to game room
room_goto(rm_game);
