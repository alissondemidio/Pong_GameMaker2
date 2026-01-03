/// @description Goalie Object - AI movement for single player mode
// Controls AI behavior for Player 2 when in single player mode
// AI tracks the ball with slight imperfection to make it beatable

// Only run AI logic if this is Player 2 in single player mode
if(player == 2 and global.number_of_players == 1){
	// Find the nearest ball instance
	var ball = instance_nearest(x, y, obj_ball);
	// Exit if no ball exists
	if (!instance_exists(ball)) exit;

	// Add a little imperfection to make AI beatable
	// Lerp between current offset and random value for smooth variation
	reaction_offset = lerp(reaction_offset, random_range(-20, 20), 0.02);

	// Calculate target Y position (ball Y + reaction offset for imperfection)
	var target_y = ball.y + reaction_offset;

	// Move toward target if distance is significant (threshold of 2 pixels)
	if (abs(target_y - y) > 2) {
	    if (target_y > y) {
	        // Move down if target is below
	        y += move_speed;
	    } else {
	        // Move up if target is above
	        y -= move_speed;
	    }
	}
}
