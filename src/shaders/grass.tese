#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs
// Done

layout (location = 0) patch in vec3 c1_tesc;
layout (location = 1) patch in vec3 c2_tesc;
layout (location = 2) patch in vec3 v1_tesc;
layout (location = 3) patch in vec3 v2_tesc;

layout(location = 0) out vec2 f_uv;


void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

	// TODO: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade
    // Done

    f_uv = vec2 (u, v);

    vec3 c0_tesc = u * c2_tesc + (1 - u) * c1_tesc;
    vec3 pos_1 = (1 - v) * c0_tesc + v * v1_tesc;
    vec3 pos_2 = (1 - v) * v1_tesc + v * v2_tesc;
    vec3 pos = (1 - v) * pos_1 + v * pos_2;

    gl_Position = camera.proj * camera.view * vec4(pos, 1.0);
}
