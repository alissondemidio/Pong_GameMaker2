/// @description Goalie Object - Initialize AI settings for single player mode
// Sets up AI behavior for Player 2 when playing in single player mode
// Configures movement speed and reaction offset for AI difficulty

// If this is Player 2 and game is in single player mode, set up AI
if(player == 2 and global.number_of_players == 1){
	move_speed = 4;           // AI movement speed
	reaction_offset = 0;      // Randomness offset for AI imperfection (starts at 0)
}
