/// @description Score Object - Check for game end condition
// Monitors scores and ends game when a player reaches 5 points
// Resets scores and returns to initial menu when game ends

// Check if game hasn't ended yet and if either player has reached 5 points
if (!global.game_over &&
    (global.score_player_one >= 5 || global.score_player_two >= 5)) {

    // Mark game as over
    global.game_over = true;

    // Stop background music
    audio_stop_sound(snd_background_music);
    // Reset scores for next game
    global.score_player_one = 0;
    global.score_player_two = 0;

    // Return to initial menu screen
    room_goto(rm_initial);
}