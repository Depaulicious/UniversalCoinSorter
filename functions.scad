function array_sum(arr, i=0) =
	i == len(arr)-1 ?
		arr[i] :
		arr[i] + array_sum(arr, i+1);

function to_vec(n, dim) =
	dim == 1 ?
		n :
		concat(n, to_vec(n, dim-1));

function deg(rad) = rad*180/PI;

function rad(deg) = deg/180*PI;

function min_v(v1, v2, i=0) =
	i == len(v1)-1 ?
		min(v1[i], v2[i]) :
		concat(min(v1[i], v2[i]), min_v(v1, v2, i+1));

function max_v(v1, v2, i=0) =
	i == len(v1)-1 ?
		max(v1[i], v2[i]) :
		concat(max(v1[i], v2[i]), max_v(v1, v2, i+1));

function calc_circ_angles(arcs, gap, i=0, offs=0) =
	i == 0 ?
		concat([deg(offs+gap/2+arcs[i]/2)], calc_circ_angles(arcs, gap, i+1, offs+gap/2*3+arcs[i])) : (
		i == len(arcs)-1 ?
			deg(offs+arcs[i]/2) :
			concat([deg(offs+arcs[i]/2)], calc_circ_angles(arcs, gap, i+1, offs+gap+arcs[i]))
		);

function map(x, in_min, in_max, out_min, out_max) = (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;

function map_v(x, in_min, in_max, out_min, out_max, i=0) =
	i == len(x)-1 ?
		(x[i] - in_min[i]) * (out_max[i] - out_min[i]) / (in_max[i] - in_min[i]) + out_min[i] :
		concat((x[i] - in_min[i]) * (out_max[i] - out_min[i]) / (in_max[i] - in_min[i]) + out_min[i], map_v(x, in_min, in_max, out_min, out_max, i+1));

module polar_translate(r, theta) {
	translate(r*[cos(theta),sin(theta)])
	children();
}

module rotate_extrude_scale_square(size, offset, angle=360, convexity=20, steps=360, scale=[0,0], center=true) {
	union()
	for (i=[ 0 : angle/steps : angle ]) {
		// translate([0,0,i==0 ? 0 : child_w])		
		// polar_translate(, i)
		translate([0,0,center ? size[1]*(1-map(i, 0, angle, min(scale[1], 1), max(scale[1], 1)))/2 : 0])
		rotate(a=[0,0,i])
		rotate_extrude(angle=angle/steps, convexity=convexity)

		translate([offset+size[0]*(1-map(i, 0, angle, min(scale[0], 1), max(scale[0], 1)))/2,0])

		scale(map_v(to_vec(i, len(scale)),
				  to_vec(0, len(scale)),
				  to_vec(angle, len(scale)),
				  min_v(scale, to_vec(1, len(scale))),
				  max_v(scale, to_vec(1, len(scale)))))
		square(size);
	}
}