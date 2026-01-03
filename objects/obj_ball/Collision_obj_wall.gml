/// @description Ball Object - Handle collision with walls
// When the ball hits a wall, it bounces and increases speed
// Speed is capped at maximum to prevent infinite acceleration

// First, move the ball out of the wall to prevent stuck collision
while (place_meeting(x, y, obj_wall)) {
    x -= lengthdir_x(1, direction);
    y -= lengthdir_y(1, direction);
}

// Bounce the ball off the wall (solid = true for proper angle calculation)
move_bounce_solid(true);
// Play bounce sound effect (priority 1, no loop)
audio_play_sound(snd_bounce, 1, false);
// Increase ball speed slightly for more intense gameplay
speed += 0.5;

// Cap speed at maximum to prevent ball from becoming too fast
speed = min(speed, global.ballmaxspeed);