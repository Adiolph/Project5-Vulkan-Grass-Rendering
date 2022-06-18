#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
// Done

layout(location = 0) in vec2 f_uv;

layout(location = 0) out vec4 outColor;

void main() {

    // Define shades of green
    vec4 light_green = vec4(150.0/255.0, 249.0/255.0, 123/255.0, 1.0);
    vec4 green = vec4(21.0/255.0, 176.0/255.0, 26.0/255.0, 1.0);
    vec4 forest_green = vec4(6.0/255.0, 71.0/255.0, 112.0/255.0, 1.0);
    vec4 grass_green = vec4(63.0/255.0, 155.0/255.0, 11.0/255.0, 1.0);

    // grey gradient
    float grey = 0.75;
    float white = 1.0;

    // Interpolate green shade
    vec4 c1 = mix(green, grass_green, f_uv[1]*f_uv[1]);

    // Interpolate brightness
    float u = 2 * abs(f_uv.x - 0.5);
    float c2 = mix(grey, white, u);
    // float c2 = 1.0;

    // Final color is multiplied
    outColor = c1 * c2;
}
