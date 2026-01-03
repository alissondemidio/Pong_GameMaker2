/// @description Score Object - Draw player scores on screen
// Draw event (layer 64) to display both player scores
// Player 1 score on left, Player 2 score on right

// Draw Player 1 score on the left side of screen
draw_text(room_width/2 - 50, 10, string(global.score_player_one));
// Draw Player 2 score on the right side of screen
draw_text(room_width/2 + 50, 10, string(global.score_player_two));