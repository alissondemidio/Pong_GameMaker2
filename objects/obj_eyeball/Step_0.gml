/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var ball = instance_nearest(x, y, obj_ball);
if (!instance_exists(ball)) exit;

// Angle from eye center to ball
var dir = point_direction(origin_x, origin_y, ball.x, ball.y);

// Distance, clamped so pupil stays inside eye
var dist = min(
    point_distance(origin_x, origin_y, ball.x, ball.y),
    max_offset
);

// Move pupil toward the ball
x = lerp(x, origin_x + lengthdir_x(dist, dir), 0.25);
y = lerp(y, origin_y + lengthdir_y(dist, dir), 0.25);
