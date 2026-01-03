/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (!global.game_over &&
    (global.score_player_one >= 5 || global.score_player_two >= 5)) {

    global.game_over = true;

    audio_stop_sound(snd_background_music);
    global.score_player_one = 0;
    global.score_player_two = 0;

    room_goto(rm_initial);
}