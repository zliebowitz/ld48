//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fBloom_threshold;
uniform float u_fBloom_range;

void main()
{
	vec4 base_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float luminance = dot(base_color.rgb, vec3(0.229, 0.587, 0.114));
	float weight = smoothstep(u_fBloom_threshold, u_fBloom_threshold + u_fBloom_range, luminance);
	base_color.rgb = mix(vec3(0.0), base_color.rgb, weight);
	
    gl_FragColor = base_color;
}