tower_radius=30;
tower_height=60;
segment_height=5;

module tower(tower_radius=30, tower_height=60,segments=5, segment_height=5){
    difference(){
    cylinder(r=tower_radius,h=tower_height, center=false, $fn=30);
    tower_texture();
        }
}
module tower_texture(tower_radius=30, tower_height=60,segments=5, segment_height=5){
    step=360/segments;
    for(i=[0:segments]){
     rotate([0,0,step*i])
    translate([-tower_radius,0,0])
    cylinder(r=5,h=segment_height, center=false, $fn=3);
    }
}

tower();