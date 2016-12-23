tower_radius=30;
tower_height=60;
segment_height=5;

module tower(tower_radius=30, tower_height=60,segments=5, layers=4){
    segment_height=tower_height/layers;
    difference(){
           //difference(){
            cylinder(r=tower_radius,h=tower_height, center=false, $fn=30);
           //  translate([0,0,5])
          //  cylinder(r=tower_radius-5,h=tower_height, center=false, $fn=30);
            //}
    tower_texture(tower_radius,segments, segment_height, layers);
        }
}
module tower_texture(tower_radius,segments, segment_height, layers){

    step=360/segments;
    for(i=[0:layers]){
    rotate([0,0,(step/2)*i])
    translate([0,0,segment_height*i])
    union(){
        for(i=[0:segments]){
            rotate([0,0,step*i])
            translate([-tower_radius,0,0])
            cylinder(r=3, h=segment_height, center=false, $fn=5);
        }
        //translate([0,0,segment_height])
            rotate_extrude()
                translate([-tower_radius,0,0])
                    circle(3, $fn=5);
        }
    }
}

translate([0,0,30])
tower(tower_radius=50, tower_height=100,segments=5, layers=6);
difference(){
cylinder(r1=60, r2=50, h=30, center=false);
translate([0,70,0])
union(){
translate([0,0,15])
rotate([90,0,0])
cylinder(r=10, h=40,center=true);
cube([20,40,30], center=true);
}
}

   

translate([0,0,130])
union(){
    cylinder(r1=50, r2=60, h=15, center=false);
    translate([0,0,15+10])
        difference(){
            cylinder(r=60, h=20,center =true);
            for(i=[0:9]){
            rotate([0,0,36*i])
            translate([-5,0,0])
            cube([10,60,10]);
            }
            cylinder(r=50, h=20,center =true);

        }
}