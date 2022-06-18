
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// TODO: Declare vertex shader inputs and outputs
// Done

layout (location = 0) in vec4 v0;
layout (location = 1) in vec4 v1;
layout (location = 2) in vec4 v2;
layout (location = 3) in vec4 up;

layout (location = 0) out vec3 c1_vert;
layout (location = 1) out vec3 c2_vert;
layout (location = 2) out vec3 v1_vert;
layout (location = 3) out vec3 v2_vert;

out gl_PerVertex {
    vec4 gl_Position;
};

void main() {
	// TODO: Write gl_Position and any other shader outputs
    // Done

    // the tengent vector
    float orientation = v0.w;
    vec3 tengent_1 = vec3(cos(orientation), 0.0, sin(orientation));
    tengent_1.y = -(up.x * tengent_1.x + up.z * tengent_1.z) / up.y;
    tengent_1 = normalize(tengent_1);
    vec3 tengent_2 = normalize(cross(normalize(up.xyz), tengent_1));
    
    // get control points at two base sides of the blade
    float weidth = v2.w;
    vec3 c1 = v0.xyz - weidth / 2.0 * tengent_2;
    vec3 c2 = v0.xyz + weidth / 2.0 * tengent_2;

    // transform to model frame
    v1_vert = (model * vec4(v1.xyz, 1.0)).xyz;
    v2_vert = (model * vec4(v2.xyz, 1.0)).xyz;
    c1_vert = (model * vec4(c1.xyz, 1.0)).xyz;
    c2_vert = (model * vec4(c2.xyz, 1.0)).xyz;
    gl_Position = model * vec4(v0.xyz, 1.0);
}
