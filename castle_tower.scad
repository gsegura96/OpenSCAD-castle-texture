tower_radius=30;
tower_height=60;
segment_height=5;

module tower(tower_radius=30, tower_height=60,segments=5, layers=4){
    segment_height=tower_height/layers;
    difference(){
    %cylinder(r=tower_radius,h=tower_height, center=false, $fn=30);
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
            cylinder(r=3, h=segment_height, center=false, $fn=3);
        }
        //translate([0,0,segment_height])
            rotate_extrude()
                translate([-tower_radius,0,0])
                    circle(3, $fn=3);
        }
    }
}

tower();
   