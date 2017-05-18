include <variables.scad>

#circle(r=rot_radius, $fn=200);

for (i = [ 0 : ncoins-1 ]) {
	polar_translate(rot_radius, can_angles[i])
	circle(d=can_diams[i], $fn=200);
}