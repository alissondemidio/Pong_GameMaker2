/// @description Ball Object - Initialize ball position and direction
// Sets up the ball with a random starting direction and initial speed
// The direction is chosen from three angle ranges to ensure interesting gameplay

// Initialize random seed for varied gameplay
randomize();

// Choose a random starting direction from three angle ranges:
// - 30-70 degrees: Up-right
// - 110-240 degrees: Down-left or down-right
// - 290-330 degrees: Up-left
direction = choose(
	random_range(30,70),
	random_range(110, 240),
	random_range(290, 330)
);

// Set initial ball speed from global variable
speed = global.ballspeed;