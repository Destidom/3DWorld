uniform float radius_scale = 1.0;

void main()
{
	set_tc0_from_vert_id();
	vec4 eye    = gl_ModelViewMatrixInverse[3]; // world space
	vec3 dir    = normalize(cross(vec3(0,0,1), (gl_Vertex.xyz - eye.xyz)));
	vec4 vertex = gl_Vertex + vec4(((2.0*gl_TexCoord[0].s - 1.0) * radius_scale * gl_Normal.x * dir), 0.0);
	gl_Position = gl_ModelViewProjectionMatrix * vertex;
	gl_FogFragCoord = length((gl_ModelViewMatrix * vertex).xyz); // set standard fog coord
	vec3 nz     = (gl_NormalMatrix * vec3(0.0, 0.0, gl_Normal.z));
	vec3 normal = normalize(nz + vec3(0.0, 0.0, sqrt(1.0 - nz.x*nz.x - nz.y*nz.y - nz.z*nz.z)));
	vec3 color  = vec3(0.0);
	if (enable_light0) color += add_light_comp(normal, 0).rgb;
	if (enable_light1) color += add_light_comp(normal, 1).rgb;
	gl_FrontColor = vec4(color, gl_Color.a);
} 
