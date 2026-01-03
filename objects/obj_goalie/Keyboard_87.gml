/// @description Goalie Object - Handle W key (Player 1 movement)
// Keyboard event for W key (keycode 87)
// Moves Player 1 up

// Only respond if this is Player 1
if(player == 1){
	y -= global.playerspeed;  // Move up by player speed
}