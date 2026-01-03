/// @description Eyeball Object - Track ball with eye movement
// Makes the eye follow the ball's position smoothly
// Pupil moves within the eye boundary to look at the ball

// Find the nearest ball instance
var ball = instance_nearest(x, y, obj_ball);
// Exit if no ball exists
if (!instance_exists(ball)) exit;

// Calculate angle from eye center to ball position
var dir = point_direction(origin_x, origin_y, ball.x, ball.y);

// Calculate distance, clamped so pupil stays inside eye boundary
// Uses minimum of actual distance and max_offset to prevent overflow
var dist = min(
    point_distance(origin_x, origin_y, ball.x, ball.y),
    max_offset
);

// Smoothly move pupil toward the ball using linear interpolation
// Lerp factor of 0.25 creates smooth, gradual movement
x = lerp(x, origin_x + lengthdir_x(dist, dir), 0.25);
y = lerp(y, origin_y + lengthdir_y(dist, dir), 0.25);
