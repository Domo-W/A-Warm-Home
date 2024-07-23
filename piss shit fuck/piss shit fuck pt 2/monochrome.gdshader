shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 pixelColor = texture(TEXTURE, UV);
	float brightness = (pixelColor.r + pixelColor.g + pixelColor.b) / 15.0;
	vec4 grayScale = vec4(brightness, brightness, brightness, pixelColor.a);
	COLOR = grayScale;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
