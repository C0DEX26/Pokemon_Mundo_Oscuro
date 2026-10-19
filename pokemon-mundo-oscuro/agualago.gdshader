
shader_type canvas_item;

uniform float velocidad = 0.25;
uniform float intensidad_ondas = 0.007;
uniform float brillo = 0.08;

void fragment() {
    vec2 uv = UV;

    // Ondas suaves en el agua
    float onda = sin(
        uv.y * 35.0 + TIME * 2.0
    ) * intensidad_ondas;

    uv.x += onda;

    // Conservar la textura original
    vec4 agua = texture(TEXTURE, uv);

    // Reflejos suaves de luz
    float reflejo = sin(
        uv.y * 55.0 +
        uv.x * 18.0 -
        TIME * velocidad * 10.0
    );

    reflejo = max(reflejo, 0.0);

    agua.rgb += vec3(
        0.5, 0.7, 1.0
    ) * reflejo * brillo;

    COLOR = agua;
}
