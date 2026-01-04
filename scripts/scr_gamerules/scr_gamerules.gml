/// @description Game Rules Script - Initialize global game variables
// This script initializes all global variables used throughout the game
// Should be called at the start of the game to set up default values

// Ball movement settings
global.ballspeed = 5;          // Initial ball speed
global.ballmaxspeed = 25;      // Maximum ball speed (prevents infinite acceleration)

// Score tracking
global.score_player_one = 0;   // Player 1 (left side) score
global.score_player_two = 0;   // Player 2 (right side) score

// Player settings
global.playerspeed = 5;        // Speed at which players can move
global.number_of_players = 1;   // Number of players (1 = single player, 2 = two players)

// Game state
global.game_over = false;      // Flag to track if game has ended

// Mobile/touch detection
global.is_mobile = scr_is_mobile();  // Detect if running on mobile/touch device