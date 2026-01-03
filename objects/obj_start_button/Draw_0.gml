/// @description Start Button Object - Draw button sprite and text
// Custom draw event to render button sprite and overlay text
// Centers text on the button for proper display

// Draw the button sprite
draw_self();

// Set text alignment to center (both horizontal and vertical)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw button text centered on button position
draw_text(x, y, btn_text);

// Reset text alignment to default (left, top)
draw_set_halign(fa_left);
draw_set_valign(fa_top);