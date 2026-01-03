var glow_power = clamp((speed - 8) / 4, 0, 1);
glow_power = power(glow_power, 1.3);
if (speed >= 12) {
    glow_power *= 0.8 + sin(current_time * 0.015) * 0.2;
    glow_power = min(glow_power + 0.25, 1);
}
if (glow_power > 0) {
    for (var i = trail_length - 1; i > 0; i--) {
        var a = (i / trail_length) * 0.4 * glow_power;
        draw_set_alpha(a);
        draw_set_color(c_red);
        draw_sprite(sprite_index, image_index, trail_x[i], trail_y[i]);
    }
    draw_set_alpha(1);
    draw_set_color(c_white);
}
if (glow_power > 0) {
    // Outline
    draw_set_color(c_red);
    draw_set_alpha(0.4 * glow_power);

    var o = 2;
    draw_sprite(sprite_index, image_index, x - o, y);
    draw_sprite(sprite_index, image_index, x + o, y);
    draw_sprite(sprite_index, image_index, x, y - o);
    draw_sprite(sprite_index, image_index, x, y + o);

    draw_set_alpha(1);
    draw_set_color(c_white);

    // Shader glow
    shader_set(shd_ball_glow);
    shader_set_uniform_f(
        shader_get_uniform(shd_ball_glow, "u_power"),
        glow_power
    );
}

draw_self();

if (glow_power > 0) {
    shader_reset();
}
