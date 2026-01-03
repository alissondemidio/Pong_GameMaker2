/// @description Player Button Object - Initialize button appearance and text
// Sets up the player selection button on the start screen
// Displays current number of players and allows toggling between 1 and 2 players

// Stop sprite animation (use static image)
image_speed = 0;
// Set to first frame (unpressed state)
image_index = 0;

// Create button text showing current player count
// Format: "1 Jogador" or "2 Jogadores"
btn_text = string(global.number_of_players) + (global.number_of_players == 1 ? " Jogador" : " Jogadores");