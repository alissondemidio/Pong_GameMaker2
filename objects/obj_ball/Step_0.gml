/// @description Ball Object - Check for scoring and reset ball
// Monitors if the ball goes off-screen on either side (scoring)
// Resets ball position and direction after a point is scored

// Check if ball went off the right side (Player 1 scores)
if (x > room_width + 32) {
    // Reset ball to center of room
    x = room_width / 2;
    y = room_height / 2;

    // Stop the ball temporarily
    speed = 0;
    // Set alarm to restart ball after 1 second (room_speed frames)
    alarm[0] = room_speed;

    // Choose new random direction for next serve
    direction = choose(
        random_range(30, 70),
        random_range(110, 240),
        random_range(290, 330)
    );

    // Play score sound effect (priority 2, no loop)
    audio_play_sound(snd_score, 2, false);
    // Increment Player 1 score
    global.score_player_one++;
}

// Check if ball went off the left side (Player 2 scores)
if (x < -32) {
    // Reset ball to center of room
    x = room_width / 2;
    y = room_height / 2;

    // Stop the ball temporarily
    speed = 0;
    // Set alarm to restart ball after 1 second (room_speed frames)
    alarm[0] = room_speed;

    // Choose new random direction for next serve
    direction = choose(
        random_range(30, 70),
        random_range(110, 240),
        random_range(290, 330)
    );

    // Play score sound effect (priority 2, no loop)
    audio_play_sound(snd_score, 2, false);
    // Increment Player 2 score
    global.score_player_two++;
}
