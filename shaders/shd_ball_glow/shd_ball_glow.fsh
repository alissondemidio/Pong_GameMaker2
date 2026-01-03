varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_power; // 0..1 glow strength

void main() {
    vec4 base = texture2D(gm_BaseTexture, v_vTexcoord);

    // Glow color: red -> white
    vec3 glow_color = mix(
        vec3(1.0, 0.1, 0.1), // red
        vec3(1.0, 1.0, 1.0), // white
        u_power
    );

    // Additive glow (DOES NOT replace base color)
    base.rgb += glow_color * u_power * 0.4;

    gl_FragColor = base * v_vColour;
}
