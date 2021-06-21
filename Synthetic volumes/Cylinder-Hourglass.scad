// 3D synthetic model
// Roller = thing thats rolling on something else
// cylinder 1
r1=8;
h1=20;
// number of facets of cylinder 1
fn1=200;
// roller
r2=8;
h2=20;
// angle of roller relativ to xy-plane
a2=45;
// distance between center of cylinder 1 and center of roller
x2=10;
// number of facets of the roller
fn2=200;
// number of rotations to generate the roller
fn3=100;
// remove roller from cylinder1 for display purpose
dx=10;
module cyl1(){
	cylinder(h1,r1,r1,true,$fn=fn1);
}

module roller(){
	translate([x2,0,0])
		rotate([90-a2,0,0])
			difference(){
				cylinder(h2,r2,r2,true,$fn=fn2);
						for(a=[360/fn3:360/fn3:360])
							rotate([0,0,a])
				rotate([-(90-a2),0,0])
					translate([-x2,0,0])
						cyl1();
			}
}

module area_of_contact(){
	color("red")
		translate([dx,0,0])
			intersection(){	
				cyl1();
				translate([-dx,0,0])roller();
			}
}

#cyl1();
translate([dx,0,0])roller();
//area_of_contact();



