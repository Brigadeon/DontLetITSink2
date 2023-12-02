shader_type canvas_item;

uniform float tile_size = 20.0; // Adjust the tile size as needed

void fragment() {
    vec2 uv = SCREEN_UV;
    vec2 tileUV = floor(uv * vec2(1.0 / tile_size)) * tile_size;
    vec4 color = texture(SCREEN_TEXTURE, tileUV);
    COLOR = color;
}
