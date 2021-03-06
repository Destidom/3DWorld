// 3D World - Throwable Sphere Materials header
// by Frank Gennari
// 9/9/16
#include "3DWorld.h"

#pragma once

struct sphere_mat_t {
	bool shadows, emissive, reflective;
	int destroyable, tid, nm_tid;
	float radius_scale, alpha, metal, spec_mag, shine, hardness, density, light_atten, refract_ix, light_radius;
	colorRGB diff_c, spec_c;
	std::string name;

	sphere_mat_t() : shadows(0), emissive(0), reflective(0), destroyable(0), tid(-1), nm_tid(-1), radius_scale(1.0), alpha(1.0), metal(1.0),
		spec_mag(0.0), shine(1.0), hardness(0.8), density(1.0), light_atten(0.0), refract_ix(1.0), light_radius(0.0), diff_c(WHITE), spec_c(WHITE) {}
	std::string get_name() const;
};

sphere_mat_t &get_cur_sphere_mat();

