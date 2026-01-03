/// @description Goalie Object - Handle S key (Player 1 movement)
// Keyboard event for S key (keycode 83)
// Moves Player 1 down

// Only respond if this is Player 1
if(player == 1){
	y += global.playerspeed;  // Move down by player speed
}
