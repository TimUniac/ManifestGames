shader_type spatial;

// Uniforms with source_ to specify the texture and parameters
uniform sampler2D source_noise_texture;
uniform float shimmer_strength : hint_range(0, 1) = 0.5;
uniform float shimmer_speed : hint_range(0, 10) = 1.0;

void fragment() {
    // Coordinates for the noise texture
	vec2 noise_coords = FRAGCOORD.xy / SCREEN_SIZE;

    // Getting the noise value, it assumes the noise texture is grayscale
    float noise_value = texture(source_noise_texture, noise_coords).r;

    // Time-based animation for the shimmer effect
    float time_anim = sin(TIME * shimmer_speed) * 0.5 + 0.5;

    // Combining noise and time to create the shimmer effect
    float shimmer = noise_value * time_anim * shimmer_strength;

    // Apply the shimmer effect to the albedo color
    ALBEDO = mix(ALBEDO, vec3(1.0), shimmer);
}

