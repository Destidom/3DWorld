uniform mat4 fg_ViewMatrix;
uniform vec4 color = vec4(1.0);

varying vec3 vpos, normal, world_normal, world_space_pos;
varying vec4 epos;

#ifdef USE_CUSTOM_XFORM
attribute mat4 inst_xform_matrix;
#endif

void main()
{
#ifdef USE_CUSTOM_XFORM
	epos   = inst_xform_matrix * fg_Vertex;
	normal = normalize(transpose(inverse(mat3(inst_xform_matrix))) * fg_Normal);
#else
	epos   = fg_ModelViewMatrix * fg_Vertex;
	normal = normalize(fg_NormalMatrix * fg_Normal); // for lighting
#endif
#ifdef ENABLE_SHADOWS
	world_space_pos = (inverse(fg_ViewMatrix) * epos).xyz;
#endif
	gl_Position   = fg_ProjectionMatrix * epos;
	gl_FrontColor = color;
	world_normal  = fg_Normal; // for triplanar texturing
	vpos          = fg_Vertex.xyz;
} 
