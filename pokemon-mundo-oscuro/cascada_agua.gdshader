
shader_type canvas_item;

uniform float velocidad : hint_range(0.0, 3.0) = 0.35;
uniform float espuma_intensidad : hint_range(0.0, 1.0) = 0.85;
uniform float espuma_altura : hint_range(0.02, 0.30) = 0.12;

void fragment() {
    vec2 uv = UV;

    // Mover el agua hacia abajo.
    uv.y = fract(uv.y - TIME * velocidad);

    vec4 agua = texture(TEXTURE, uv);

    // Recuperar la espuma original de la parte inferior.
    vec4 original = texture(TEXTURE, UV);

    // Zona de espuma en la base de la cascada.
    float zona_espuma = smoothstep(
        1.0 - espuma_altura,
        1.0,
        UV.y
    );

    // Mezclar agua en movimiento con espuma fija.
    vec4 resultado = mix(
        agua,
        original,
        zona_espuma
    );

    // Dar un tono blanco azulado a la espuma.
    vec3 color_espuma = vec3(0.90, 0.97, 1.0);

    resultado.rgb = mix(
        resultado.rgb,
        color_espuma,
        zona_espuma * espuma_intensidad
    );

    COLOR = resultado;
}
