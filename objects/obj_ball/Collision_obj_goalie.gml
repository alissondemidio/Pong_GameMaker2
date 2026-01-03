/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

while (place_meeting(x, y, obj_goalie)) {
    x -= lengthdir_x(1, direction);
    y -= lengthdir_y(1, direction);
}


move_bounce_solid(true);
audio_play_sound(snd_bounce, 1, false)
speed += 0.5;

speed = min(speed, global.ballmaxspeed);