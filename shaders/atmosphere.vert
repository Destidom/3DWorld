uniform mat4 world_space_mvm;
varying vec4 epos;
varying vec3 normal, world_space_pos;

void main()
{
	normal          = normalize(gl_NormalMatrix * gl_Normal);
	epos            = gl_ModelViewMatrix * gl_Vertex;
	world_space_pos = (inverse(world_space_mvm) * epos).xyz;
	gl_Position     = ftransform();
	gl_FrontColor   = vec4(1.0); // white
}
