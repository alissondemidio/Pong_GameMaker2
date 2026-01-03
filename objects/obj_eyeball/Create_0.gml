/// @description Eyeball Object - Initialize eye tracking variables
// Sets up the eyeball object that tracks the ball
// Stores origin position and maximum offset for pupil movement

// Store initial position as center of eye
origin_x = x;
origin_y = y;
// Maximum distance pupil can move from center (keeps it inside eye)
max_offset = 15;