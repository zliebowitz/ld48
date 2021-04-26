//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Sigma for the Gaussian Blur equation
uniform float u_fSigma;

// We blur from -u_fBlur_steps to +u_fBlur_steps in both the
// x and y axes.
uniform float u_fBlur_steps;

// Blur type: (1, 0) = horizontal, (0, 1) = vertical.
uniform vec2 u_vBlur_type;

// Width and height of the surface being rendered.
uniform vec2 u_vSurface_size;

float weight(float pos)
{
	return exp(-(pos * pos) / (2.0 * u_fSigma * u_fSigma));
}

void main()
{
	// The size of one texel/pixel in our texture page.
	// Note that the texture page is assumed to be the surface
	// and that the width and height are always 1.0 in GLSL.
	// The width and height of the surface should be passed in
	// through u_vSurface_size.
	vec2 texel_size = vec2(1.0 / u_vSurface_size.x, 1.0 / u_vSurface_size.y);
	
	// The total number of samples being used to create our blur.
	float num_columns = 2.0 * u_fBlur_steps + 1.0;
	
	highp vec4 blurred_color = vec4(0.0);
	float offset;
	vec2 sample_location;
	float sample_weight;
	float total_weight = 0.0;
	
	for (offset = -u_fBlur_steps; offset <= u_fBlur_steps; offset++)
	{
		sample_weight = weight(offset / num_columns);
		total_weight += sample_weight;
			
		sample_location = v_vTexcoord + offset * texel_size * u_vBlur_type;
		blurred_color += texture2D(gm_BaseTexture, sample_location) * sample_weight;
	}
	
	gl_FragColor = v_vColour * blurred_color / total_weight;
}