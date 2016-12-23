tower_radius=30;
tower_height=60;
segment_height=5;

module tower(tower_radius=30, tower_height=60,segments=5, segment_height=15){
    difference(){
    cylinder(r=tower_radius,h=tower_height, center=false, $fn=30);
    tower_texture(tower_radius, tower_height,segments, segment_height);
        }
}
module tower_texture(tower_radius, tower_height,segments, segment_height){
    step=360/segments;
    for(i=[0:5]){
    translate([0,0,segment_height*i])
    union(){
        for(i=[0:segments]){
            rotate([0,0,step*i])
            translate([-tower_radius,0,0])
            cylinder(r=5, h=segment_height, center=false, $fn=3);
        }
        translate([0,0,segment_height])
            rotate_extrude()
                translate([-tower_radius,0,0])
                    circle(5, $fn=3);
        }
    }
}

tower();
   