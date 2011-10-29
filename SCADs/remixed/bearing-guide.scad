//PRUSAMendel
//GNUGPLv2
//GregFrost

/**
*@categoryPrinted
*/

single_layer_width=1.01;
bearing_inner=22.3;
bearing_thickness=7;
thickness=2.0;
belt_width=5;


height=belt_width + 1 + thickness * 2;
wall_ascent=6 + single_layer_width;
wall_descent=1;

module inner()
{
	//render()
		difference()
		{
			union() {
				cylinder(r=bearing_inner/2+single_layer_width,h=height);
				cylinder(r=bearing_inner/2+wall_ascent,h=thickness * 0.5);
				translate([0, 0,thickness * 0.5 - 0.01])
					cylinder(r1=bearing_inner/2+wall_ascent, r2=bearing_inner/2-wall_descent, h=thickness * 1.5);
			}
			translate([0,0,-1])
				cylinder(r=bearing_inner/2-wall_descent,h=height + thickness + 2);
			translate([0,0,height - bearing_thickness])
				cylinder(r=bearing_inner/2,h=height+2);
		}
}

module outer()
{
	//render()
		difference()
		{
			union() {
				cylinder(r=bearing_inner/2+2*single_layer_width,h=height);
				cylinder(r=bearing_inner/2+wall_ascent,h=thickness * 0.5);
				translate([0, 0, thickness * 0.5 - 0.01])
					cylinder(r1 = bearing_inner/2+wall_ascent, r2=bearing_inner/2 + 2 * single_layer_width, h=thickness * 1.5);
			}
			translate([0,0,-1])
				cylinder(r=bearing_inner/2-wall_descent,h=height + thickness + 2);
			translate([0,0,height - bearing_thickness])
				cylinder(r=bearing_inner/2+single_layer_width,h=height+2);
		}
}

for (i = [0:2]) {
	translate([0, i * 40, 0]) {
		inner();
		translate([bearing_inner + wall_ascent * 2 + 3,0,0])
			outer();
	}
}
