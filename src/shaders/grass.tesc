#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation control shader inputs and outputs
// Done

layout (location = 0) in vec3 c1_vert[];
layout (location = 1) in vec3 c2_vert[];
layout (location = 2) in vec3 v1_vert[];
layout (location = 3) in vec3 v2_vert[];

layout (location = 0) patch out vec3 c1_tesc;
layout (location = 1) patch out vec3 c2_tesc;
layout (location = 2) patch out vec3 v1_tesc;
layout (location = 3) patch out vec3 v2_tesc;

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// TODO: Write any shader outputs
    // Done

    // pass data
    c1_tesc = c1_vert[0];
    c2_tesc = c2_vert[0];
    v1_tesc = v1_vert[0];
    v2_tesc = v2_vert[0];

    // vary detail with distance
    vec4 v0 = camera.view * gl_in[gl_InvocationID].gl_Position;
    float z = -v0.z / v0.w;
    z = (z - 0.1)/(100.0 - 0.1);
    z  = (1.0 - z);

    // Set level of tesselation
    float n = ceil(10.0 * z);

	// TODO: Set level of tesselation
    // Done
    gl_TessLevelInner[0] = 1.0;
    gl_TessLevelInner[1] = n;
    gl_TessLevelOuter[0] = n;
    gl_TessLevelOuter[1] = 1.0;
    gl_TessLevelOuter[2] = n;
    gl_TessLevelOuter[3] = 1.0;
}
