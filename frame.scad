include <variables.scad>


translate([-funnel_bracket_thickn_horz/2,-int_radius_max,can_z-funnel_bracket_thickn_z+frame_thickn])
linear_extrude(funnel_bracket_thickn_z)
square([funnel_bracket_thickn_horz, int_radius_max*2]);

translate([-int_radius_max,-funnel_bracket_thickn_horz/2,can_z-funnel_bracket_thickn_z+frame_thickn])
linear_extrude(funnel_bracket_thickn_z)
square([int_radius_max*2, funnel_bracket_thickn_horz]);

translate([-funnel_bracket_thickn_horz/2,-int_radius_max])
linear_extrude(funnel_bracket_thickn_z)
square([funnel_bracket_thickn_horz, int_radius_max*2]);

translate([-int_radius_max,-funnel_bracket_thickn_horz/2])
linear_extrude(funnel_bracket_thickn_z)
square([int_radius_max*2, funnel_bracket_thickn_horz]);

// difference() {
	rotate(a=[0,0,deg(can_arcs[1])*1.25])
	rotate_extrude_scale_square([max_frame_thickn-can_frame_protrusion+frame_thickn, can_z+frame_thickn], int_radius_min-frame_thickn, scale=[rad_scale, 1], angle=360-deg(can_arcs[1])*2);
	rotate(a=[0,0,deg(can_arcs[1])*1.25])
	mirror([0,1,0])
	rotate_extrude_scale_square([max_frame_thickn-can_frame_protrusion+frame_thickn, can_z+frame_thickn], int_radius_min-frame_thickn, scale=[rad_scale, 1], angle=deg(can_arcs[1])*2);

	color("green")
	translate([0,0,frame_thickn])
	linear_extrude(can_z)
	for (i = [ 0 : ncoins-1 ]) {
		polar_translate(rot_radius, can_angles[i])
		circle(d=can_diams[i]+2*can_thickn, $fn=coin_fns[i]);
	}
// }

// rotate_extrude(angle=70)
// translate([20,0])
// square(30);