shader_type canvas_item;

uniform bool is_correctly_placed;
uniform vec4 glow_color = vec4(1.0, 1.0, 0.0, 1.0); // Default glow color
uniform float glow_strength = 1; // Default glow strength

void fragment() {
    if (is_correctly_placed) {
        // Basic glow effect logic
        float glow = glow_strength / length(FRAGCOORD.xy - SCREEN_UV * SCREEN_PIXEL_SIZE.xy);
        COLOR = vec4(glow_color.rgb, 1.0) * glow;
    } else {
        // Normal sprite rendering
        COLOR = texture(TEXTURE, UV);
    }
}
