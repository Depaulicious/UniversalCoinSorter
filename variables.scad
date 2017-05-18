debug = false;

include <functions.scad>
include <config.scad>

ncoins = len(coin_sizes);
_can_diams  = [ for (i = [ 0 : ncoins - 2 ]) let (j=(coin_sizes[i]+coin_sizes[i+1])/2 ) j ];
can_diams = concat(_can_diams, _can_diams[ncoins-2]+coin_sizes[ncoins-1]-coin_sizes[ncoins-2]);
tot_sizes = array_sum(can_diams);
tot_gaps = ncoins*cans_gap_tang;
rot_circumf = (tot_sizes + tot_gaps + ncoins*(2*can_thickn));

if (debug) echo(can_diams);

can_arcs = [ for (i = [ 0 : ncoins -1 ]) let (j=(can_diams[i]*2*PI/rot_circumf)) j ];
gap_arc = (2*PI - array_sum(can_arcs))/ncoins;
can_angles = calc_circ_angles(can_arcs, gap_arc); // THIS IS NOW DEGREES
if (debug) echo(can_arcs);
if (debug) echo(can_angles);

rot_radius = rot_circumf/(2*PI);
ext_radius = rot_radius + can_diams[ncoins-1]/2 + can_thickn;
int_radius = rot_radius - can_diams[ncoins-1]/2 - can_thickn;

if (debug) echo(rot_circumf);
if (debug) echo(rot_radius);