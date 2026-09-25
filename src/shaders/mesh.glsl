#version 450
#extension GL_EXT_mesh_shader : require

#pragma shader_stage(mesh)

layout(local_size_x = 32, local_size_y = 1, local_size_z = 1) in;
layout(lines, max_vertices = 64, max_primitives = 84) out;

layout(location = 0) out vec3 fragColor[];

vec2 positions[3] = vec2[](
    vec2(0.0, -0.5),
    vec2(0.5, 0.5),
    vec2(-0.5, 0.5)
);

vec3 colors[3] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);

void main()
{
    SetMeshOutputsEXT(3, 3);

    // shift triangle to the corner of the screen to test clipping
    vec2 offset = vec2(0.7, 0.0);

    if(gl_LocalInvocationIndex < 3)
    {
        uint v = gl_LocalInvocationIndex;
        gl_MeshVerticesEXT[v].gl_Position = vec4(offset + positions[v], 0.0, 1.0);
        fragColor[v] = colors[v];
    }

    if(gl_LocalInvocationIndex < 3)
    {
        uint i = gl_LocalInvocationIndex;
        gl_PrimitiveLineIndicesEXT[i] = uvec2(i, (i + 1) % 3);
    }

}
