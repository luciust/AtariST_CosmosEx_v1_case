$fn=10;

difference () {//cutting the PSU Hole
 difference () {//cutting the HDMI Hole
  difference() {//cutting the top case to fill the AtariST(c) 45 angled bars
   difference(){//cutting the inside of the cube for CosmosEx
    difference(){ //cut the bottom of the case - it's going to be open 
  //main chassis - rounded
    translate([4,4,4]) { minkowski(){ //placing into position
     cube([101+4,140,28+4]);      //main chassis
     sphere(3.1);                   //rounding the edges
     }
     }
  
  translate([-4,-4,-2]) cube([130,160+12,4]); //cut the bottom   
  } 
  //wide - 101mm
  //long with cable - 144mm
  //height - 31 with screws
  translate([6,0,1]) cube([101,144+4,32]); //empting shell - cut/carve the box
 }
 translate([6,0.9,32]) cube([101,49,8]); //the window for the famous ST bars
 }
 translate([105,93,13.8]) cube([10,24,6.3]); //cutting the HDMI HOLE
 } 
 translate([105,42,17.5]) cube([10,15,10]); //PSU HOLE
}
 //ruler - distance from the front
 //%translate([105,57.1,25]) cube([10,90,2]); //long
 //%translate([105,50,27.5]) cube([10,10,5.6]); //psu from top
 //%translate([105,90,20]) cube([10,10,13]); 


module st_long_bar() //this is a single Atari ST bar
{
 hull() {
  minkowski() {
   difference(){ //cutting the actual trapezoid on ST
   minkowski() { //main bar as huge bar, smoothed with minkowski
   translate([50,3,35]) cube([2,66,3]);
   sphere(1);
   }  
   //angling with another bar an cutting
   translate([45.3,1.6,37.4]) rotate([0,35,0]) cube([4,87,6]);
   }
  sphere(0.5); //the final rounding sphere
  }    
 }   
}

translate([0,-6,0.1]){
difference(){ // drawing here evenly spaced bars - in the for loop, evey 8mm
for (spacing =[-74,-66,-58,-50,-42,-34,-26,-18,-10,-2,6,14,22,30,38,46,54,62,70])
     { 
      translate([spacing,44,-0.58]) rotate([0,0,-45]) st_long_bar(84,3); 
     }
difference(){ // two cubes that will cut the final shape of bars for the CosmosEX case
translate([-46,0,32]) cube([210,68,8]); //outer bar that will cut the excess
translate([5,8,31]) cube([103,55,10]); //the actual window which will produce the bars cut to the 
 }
}    
}

// suporting bar at the end of case

 translate([6,1,33.08]) cube([101,4,3]); //the window for the famous ST bars

