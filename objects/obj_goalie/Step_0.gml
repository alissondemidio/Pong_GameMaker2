/// @description Goalie Object - Handle touch drag and AI movement
// Supports touch-and-drag on mobile devices
// Controls AI behavior for Player 2 when in single player mode

// Touch-and-drag movement for mobile devices
if (global.is_mobile && mouse_check_button(mb_left)) {
    // Determine which side of screen this paddle is on
    var paddle_side = (x < room_width / 2) ? 1 : 2; // 1 = left, 2 = right
    
    // Check if touch is in this paddle's side of the screen
    var touch_in_side = false;
    if (paddle_side == 1 && mouse_x < room_width / 2) {
        touch_in_side = true;
    } else if (paddle_side == 2 && mouse_x >= room_width / 2) {
        touch_in_side = true;
    }
    
    // If touch is in this paddle's side, move paddle to touch Y position
    if (touch_in_side) {
        // Only move if this paddle should respond to touch
        var should_respond = false;
        
        if (player == 1) {
            // Player 1 always responds on left side
            should_respond = (paddle_side == 1);
        } else if (player == 2) {
            // Player 2 responds on right side only in 2-player mode
            should_respond = (paddle_side == 2 && global.number_of_players == 2);
        }
        
        if (should_respond) {
            // Get target Y position from mouse/touch
            var target_y = mouse_y;
            
            // Calculate sprite bounds
            var min_y = 0;  // Top wall is at y=0
            var max_y = 320 - sprite_height;  // Bottom wall is at y=320
            
            // Clamp target to valid range
            target_y = clamp(target_y, min_y, max_y);
            
            // Move toward target using speed-based movement (respects solid collisions)
            // This ensures GameMaker's solid collision system works properly
            if (abs(target_y - y) > 1) {
                if (target_y > y) {
                    // Move down
                    y += global.playerspeed;
                    // Check collision and stop if hitting wall
                    if (place_meeting(x, y, obj_wall)) {
                        y -= global.playerspeed;
                    }
                } else {
                    // Move up
                    y -= global.playerspeed;
                    // Check collision and stop if hitting wall
                    if (place_meeting(x, y, obj_wall)) {
                        y += global.playerspeed;
                    }
                }
            }
        }
    }
}

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
