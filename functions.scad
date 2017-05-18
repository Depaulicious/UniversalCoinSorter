function array_sum(arr, i=0) =
	i == len(arr)-1 ?
		arr[i] :
		arr[i] + array_sum(arr, i+1);

function deg(rad) = rad*180/PI;

function rad(deg) = deg/180*PI;

function calc_circ_angles(arcs, gap, i=0, offs=0) =
	i == 0 ?
		concat([deg(offs+gap/2+arcs[i]/2)], calc_circ_angles(arcs, gap, i+1, offs+gap/2*3+arcs[i])) : (
		i == len(arcs)-1 ?
			deg(offs+arcs[i]/2) :
			concat([deg(offs+arcs[i]/2)], calc_circ_angles(arcs, gap, i+1, offs+gap+arcs[i]))
		);


module polar_translate(r, theta) {
	translate(r*[cos(theta),sin(theta)])
	children();
}