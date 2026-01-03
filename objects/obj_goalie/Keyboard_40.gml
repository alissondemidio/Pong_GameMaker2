/// @description Goalie Object - Handle Down Arrow key (Player 2 in two-player mode)
// Keyboard event for Down Arrow key (keycode 40)
// Moves Player 2 down when in two-player mode

// Only respond if this is Player 2 and game is in two-player mode
if(player == 2 and global.number_of_players == 2){
	y += global.playerspeed;  // Move down by player speed
}
