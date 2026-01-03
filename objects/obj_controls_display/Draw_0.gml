/// @description Controls Display Object - Draw game controls
// Displays controls for both single player and two player modes
// Positioned in bottom right corner of the screen

// Helper function to draw text with black outline for visibility
function draw_text_outlined(_x, _y, _text, _text_color) {
    var outline_width = 2;
    
    // Draw black outline by drawing text in 8 directions
    draw_set_color(c_black);
    draw_set_alpha(1);
    draw_text(_x - outline_width, _y - outline_width, _text);
    draw_text(_x, _y - outline_width, _text);
    draw_text(_x + outline_width, _y - outline_width, _text);
    draw_text(_x - outline_width, _y, _text);
    draw_text(_x + outline_width, _y, _text);
    draw_text(_x - outline_width, _y + outline_width, _text);
    draw_text(_x, _y + outline_width, _text);
    draw_text(_x + outline_width, _y + outline_width, _text);
    
    // Draw main text on top
    draw_set_color(_text_color);
    draw_text(_x, _y, _text);
}

// Set text alignment to left
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Starting position (bottom right with padding)
var start_x = room_width - 230;
var start_y = room_height - 200;
var line_height = 18;
var y_offset = 0;

// Draw title with outline
draw_set_font(-1); // Default font
draw_text_outlined(start_x, start_y + y_offset, "CONTROLS:", c_yellow);
y_offset += line_height + 5;

// Draw controls based on number of players
if (global.number_of_players == 1) {
    // Single Player Mode
    draw_text_outlined(start_x, start_y + y_offset, "Player 1 (Left):", c_white);
    y_offset += line_height;
    draw_text_outlined(start_x + 15, start_y + y_offset, "W - Move Up", c_white);
    y_offset += line_height;
    draw_text_outlined(start_x + 15, start_y + y_offset, "S - Move Down", c_white);
    y_offset += line_height + 5;
    draw_text_outlined(start_x, start_y + y_offset, "Player 2 (Right):", c_white);
    y_offset += line_height;
    draw_text_outlined(start_x + 15, start_y + y_offset, "AI Controlled", c_white);
} else {
    // Two Player Mode
    draw_text_outlined(start_x, start_y + y_offset, "Player 1 (Left):", c_white);
    y_offset += line_height;
    draw_text_outlined(start_x + 15, start_y + y_offset, "W - Move Up", c_white);
    y_offset += line_height;
    draw_text_outlined(start_x + 15, start_y + y_offset, "S - Move Down", c_white);
    y_offset += line_height + 5;
    draw_text_outlined(start_x, start_y + y_offset, "Player 2 (Right):", c_white);
    y_offset += line_height;
    draw_text_outlined(start_x + 15, start_y + y_offset, "UP Arrow - Move Up", c_white);
    y_offset += line_height;
    draw_text_outlined(start_x + 15, start_y + y_offset, "DOWN Arrow - Move Down", c_white);
}

// Reset text settings
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

