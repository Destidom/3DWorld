varying vec4 vertex;
#ifdef USE_HEIGHT_TEX
uniform float x1, y1, dx_inv, dy_inv;
uniform sampler2D height_tex;
#endif

void main()
{
	setup_texgen0();
	setup_texgen1();
	setup_texgen2();
	vertex = gl_Vertex;
#ifdef USE_HEIGHT_TEX
	vertex.z = texture2D(height_tex, vec2((vertex.x - x1)*dx_inv, (vertex.y - y1)*dy_inv)).r;
	gl_Position = gl_ModelViewProjectionMatrix * vertex;
#else
	gl_Position = ftransform();
#endif
	set_fog_coord(vertex);
} 
