use <functions.scad>

// SORTED coin sizes + names
coin_sizes = [16.25, 18.75, 21.25, 19.75, 22.25, 24.25, 23.25, 25.75];
coin_text  = ["1¢", "2¢", "5¢", "10¢", "20¢", "50¢", "1€", "2€"];
// Coin faces number values ($fn). It's a vector with the same size as the ones above. Use big numbers if coins are circular, low if they're polygonal (e.g. 6 if they're hexagonal).
coin_fns   = to_vec(100, len(coin_sizes));

// Funnel
funnel_scale_f = 2;
funnel_base_z = 20;
funnel_top_z = 20;

// Frame
cans_gap_tang = 5; // approximate, will be less than this
frame_thickn = 3;
funnel_bracket_thickn_z = 2;
funnel_bracket_thickn_horz = 6;

// Cans
can_thickn = 1.5;
can_base_thickn = 2;
can_z = 100;
can_frame_protrusion = 5;



debug = true;