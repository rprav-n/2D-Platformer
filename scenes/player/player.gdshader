shader_type canvas_item;

uniform vec4 baseColor: source_color;

void fragment() {
	vec4 texColor = texture(TEXTURE, UV);
	COLOR.rgba = vec4(baseColor.r, baseColor.g, baseColor.b, texColor.a);
}
