/// @description Goalie Object - Handle Up Arrow key (Player 2 in two-player mode)
// Keyboard event for Up Arrow key (keycode 38)
// Moves Player 2 up when in two-player mode

// Only respond if this is Player 2 and game is in two-player mode
if(player == 2 and global.number_of_players == 2){
	y -= global.playerspeed;  // Move up by player speed
}