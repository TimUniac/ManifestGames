shader_type canvas_item;

uniform vec2 shadow_offset = vec2(2.0, -2.0); // Shadow offset
uniform vec4 shadow_color = vec4(0.0, 0.0, 0.0, 0.5); // Shadow color and alpha
uniform float shadow_alpha_threshold = 0.1; // Alpha threshold for the shadow

void fragment() {
    vec4 texColor = texture(TEXTURE, UV);
    vec4 shadowTexColor = texture(TEXTURE, UV + shadow_offset / SCREEN_PIXEL_SIZE);
    float shadowAlpha = shadowTexColor.a > shadow_alpha_threshold ? shadow_color.a : 0.0;
    COLOR = mix(vec4(shadow_color.rgb, shadowAlpha), texColor, texColor.a);
}