module motorHolders(x, diameter, height) {
  motorHolder(x, x, diameter, height); 
  motorHolder(-x, x, diameter, height); 
  motorHolder(x, -x, diameter, height); 
  motorHolder(-x, -x, diameter, height); 
}

module motorHoles(x, diameter, height) {
  motorHole(x, x, diameter, height); 
  motorHole(x, -x, diameter, height); 
  motorHole(-x, x, diameter, height); 
  motorHole(-x, -x, diameter, height); 
}

module motorHolder(x, y, motorDiameter, height = 3) {
  motorRadius = motorDiameter / 2;
  translate([x, y, 0])
  linear_extrude(height)
  circle(motorRadius + 2);
}

module motorHole(x, y, motorDiameter, height = 3) {
  motorRadius = motorDiameter / 2;
  translate([x, y, -1])
  linear_extrude(height + 2)
  circle(motorRadius);
}


module sides(x, sideOffset, h) {
  sideTB(x, sideOffset, 1, h);
  sideTB(x, sideOffset, -1, h);
  sideLR(x, sideOffset, 1, h);
  sideLR(x, sideOffset, -1, h);
}

module sideLR(x, sideOffset, dir, h) {
  p0=[dir * x, x - sideOffset];
  p1=[dir * sideOffset, 0];
  p2=[dir * x, -x + sideOffset];
  linear_extrude(h)
  BezConic( p0, p1, p2, steps=20);
}

module sideTB(x, sideOffset, dir, h) {
  p0=[x - sideOffset, dir * x];
  p1=[0, dir * sideOffset];
  p2=[-x + sideOffset, dir * x];
  linear_extrude(h)
  BezConic( p0, p1, p2, steps=20);
}

module cross(x, sideOffset, dir, h) {
  p0 = [dir * x, x - sideOffset];
  p1 = [dir * (x - sideOffset), x];
  p2 = [dir * -x, -x + sideOffset];
  p3 = [dir * (-x + sideOffset), -x];

  linear_extrude(h)
  polygon([p0, p1, p2, p3]);
}

module centerHole(h) {
  union() {
    translate([-10, -6, -1])
    cube([20, 12, h + 2]);
    translate([-8, -(23.5 / 2) + 1, -1])
    cube([16, 22.5, h + 2]);

    translate([-8, -(23.5 / 2) - 8, -1])
    cube([16, 8, h + 2]);
  }
}

module strapHoles(h) {
  union() {

    translate([-22, 10, -1])
    cylinder(r = 2, h = h + 3);  

    translate([22, 10, -1])
    cylinder(r = 2, h = h + 3);  
  
    translate([-22, -10, -1])
    cylinder(r = 2, h = h + 3);  

    translate([22, -10, -1])
    cylinder(r = 2, h = h + 3);  

    translate([-24, 9.5, -1])
    cylinder(r = 1, h = h + 3);  

    translate([24, 9.5, -1])
    cylinder(r = 1, h = h + 3);  
  
    translate([-24, -9.5, -1])
    cylinder(r = 1, h = h + 3);  

    translate([24, -9.5, -1])
    cylinder(r = 1, h = h + 3);  


  }
}
