/// @description Player Button Object - Handle mouse click (toggle player count)
// Mouse event for left button press (button 4)
// Toggles between 1 and 2 players when button is clicked

// Toggle player count: if 1, becomes 2; if 2, becomes 1
// Formula: (current % 2) + 1 cycles between 1 and 2
global.number_of_players = (global.number_of_players % 2) + 1;
// Update button text to reflect new player count
btn_text = string(global.number_of_players) + (global.number_of_players == 1 ? " Jogador" : " Jogadores");
