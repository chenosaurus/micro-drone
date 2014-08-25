// X120 Micro Quad Frame

use <bezierconic.scad>;
include <X120components.scad>;

$fn = 30;

motorDistance = 120; // motor to motor distance
motorDiameter = 8.8; // hole size for 8.5mm motor
sideOffset = 3;

motorHolderHeight = 4;
crossHeight = 2;
sideHeight = 2;

x = sqrt(pow(motorDistance / 2, 2) * 2) / 2;

difference() {

  mainBody();

  motorHoles(x, motorDiameter, motorHolderHeight);
  centerHole(crossHeight);

  strapHoles(crossHeight);
}

module mainBody() {

  // motors
  motorHolders(x, motorDiameter, motorHolderHeight); 

  // cross beams
  cross(x, sideOffset, 1, crossHeight);
  cross(x, sideOffset, -1, crossHeight);

  // curved sides
  sides(x, sideOffset, sideHeight);
  
  boardMount(sideHeight);
}

module boardMount(h) {

  union() {
    translate([-12, (23.5 / 2), 0])
    cube([4, 2, h + 2]);

    translate([8, (23.5 / 2), 0])
    cube([4, 2, h + 2]);

    translate([-12, -(23.5 / 2), 0])
    cube([2, 23.5, h + 1]);

    translate([10, -(23.5 / 2), 0])
    cube([2, 23.5, h + 1]);


    translate([-10, - (23.5 / 2) - 10, 0])
    cube([4, 2, h + 2]);

    translate([6, - (23.5 / 2) - 10, 0])
    cube([4, 2, h + 2]);
  }
}
