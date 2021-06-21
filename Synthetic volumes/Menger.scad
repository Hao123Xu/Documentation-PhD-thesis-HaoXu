// Menger Sponge by Hans Loeblich

// The 3d shape is created by the intersection of 3 orthogonal linear_extruded sierpinski carpets.

menger(100,3);

//menger_cut(100,3);

//animated_menger(100,3); 

//optimized_menger(4);

// Optimized for smaller STL file sizes.  Object size is scaled so that points fall on whole number coordinates only.
// These file size savings are negligible if you convert to binary STL format anyways (not supported in OpenSCAD, but can be converted after saving)
// This technique is also not applicable to diagonally cut menger sponge
module optimized_menger(n) {
  s=pow(3,n);
  translate([s/2,s/2,s/2]) menger(s,n);
}

// cube cut along diagonal for ease of printing, two prints will form the whole shape
module menger_cut(size, n) {
  difference() {
    rotate([45,atan(1/sqrt(2)),0]) menger(size,n);
    translate([0,0,-size]) cube(size*2, center=true);
  }
}

// n==3 render: 48s
// n==4 render: 22m15s 7.3GB ram
// n==5 render: a couple days, and 80-90GB memory (preview is still fast though, 2s)
module menger(s, n) {
  intersection() {
    rotate([ 0,90,0]) translate([0,0,-s/2-1]) linear_extrude(s+2, convexity=pow(2,n)) sierpinski(s,n);
    rotate([90, 0,0]) translate([0,0,-s/2-1]) linear_extrude(s+2, convexity=pow(2,n)) sierpinski(s,n);
    rotate([ 0, 0,0]) translate([0,0,-s/2-1]) linear_extrude(s+2, convexity=pow(2,n)) sierpinski(s,n);
  }
}

module sierpinski(s, n) {
  difference() { 
    square(s, center=true);
    _sierpinski(0,0,s,n);
  }
}

module _sierpinski(x, y, s, n) {
  translate([x,y]) {
    if (n>0) {
      i = n-1;
      scale([1/3,1/3]) {
        square(s, center=true);
        if (i>0) {
          _sierpinski(-s,-s, s, i);
          _sierpinski(-s, 0, s, i);
          _sierpinski(-s, s, s, i);
          _sierpinski( 0,-s, s, i);
          //_sierpinski( 0, 0, s, i);
          _sierpinski( 0, s, s, i);
          _sierpinski( s,-s, s, i);
          _sierpinski( s, 0, s, i);
          _sierpinski( s, s, s, i);
        }
      }
    }
  }
}

module animated_menger(s, n) {
  t0 = get_step_t(0, 6);
  t1 = get_step_t(1, 6);
  t2 = get_step_t(2, 6);
  t3 = get_step_t(3, 6);
  t4 = get_step_t(4, 6);
  t5 = get_step_t(5, 6);

  //echo(t0,t1,t2,t3,t4,t5);

  if (t0 > 0) color([1,0,0,0.8]) scale([1.01,1,0.99]) rotate([ 0,90, 0]) translate([0,0,-3*s/2]) linear_extrude(s*t0, convexity=pow(2,n)) sierpinski(s,n);
  if (t2 > 0) color([0,1,0,0.8]) scale([0.99,1.01,1]) rotate([90, 0, 0]) translate([0,0,-3*s/2]) linear_extrude(s*t2, convexity=pow(2,n)) sierpinski(s,n);
  if (t4 > 0) color([0,0,1,0.8]) scale([1,0.99,1.01]) rotate([ 0, 0, 0]) translate([0,0,-3*s/2]) linear_extrude(s*t4, convexity=pow(2,n)) sierpinski(s,n);

  intersection() {
    if (t1 > 0) color([1,0,0,0.8]) scale([1.01,1,0.99]) rotate([ 0,90, 0]) translate([0,0,-s/2]) linear_extrude(s*t1, convexity=pow(2,n)) sierpinski(s,n);
    if (t3 > 0) color([0,1,0,0.8]) scale([0.99,1.01,1]) rotate([90, 0, 0]) translate([0,0,-s/2]) linear_extrude(s*t3, convexity=pow(2,n)) sierpinski(s,n);
    if (t5 > 0) color([0,0,1,0.8]) scale([1,0.99,1.01]) rotate([ 0, 0, 0]) translate([0,0,-s/2]) linear_extrude(s*t5, convexity=pow(2,n)) sierpinski(s,n);
  }
}

function get_step_t(step, total) = let(t = $t*total - step) min(1,t);
