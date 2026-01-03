/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (x > room_width + 32) {
    x = room_width / 2;
    y = room_height / 2;

    speed = 0;                 // STOP the ball
    alarm[0] = room_speed;     // ⏱ 1 second delay

    direction = choose(
        random_range(30, 70),
        random_range(110, 240),
        random_range(290, 330)
    );

    audio_play_sound(snd_score, 2, false);
    global.score_player_one++;
}

if (x < -32) {
    x = room_width / 2;
    y = room_height / 2;

    speed = 0;                 // STOP the ball
    alarm[0] = room_speed;     // ⏱ 1 second delay

    direction = choose(
        random_range(30, 70),
        random_range(110, 240),
        random_range(290, 330)
    );

    audio_play_sound(snd_score, 2, false);
    global.score_player_two++;
}
