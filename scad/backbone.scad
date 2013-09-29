backbone(90,14,8,23,12.5);

module backbone(backbone_length, backbone_width, backbone_height, shoulder_length, shoulder_width){
	h_pos = ((backbone_length-20) / 2);		
	difference(){
		// main
		translate([-(backbone_width/2),-(backbone_length/2),-(backbone_height/2)]) color("purple") cube([backbone_width,backbone_length,backbone_height]);

		//servo body cutouts
		for (i = [[-16.5,h_pos,0],[16.5,h_pos,0],[-16.5,-h_pos,0],[16.5,-h_pos,0]]){
			translate(i) #cube([shoulder_length,shoulder_width,backbone_height], center=true);
		}		

		//servo mount holes
		for (i = [[2.5,h_pos,-10],[-2.5,h_pos,-10],[-2.5,-h_pos,-10],[2.5,-h_pos,-10]]){
			translate(i) cylinder(r=1,h=20,$fn=20);
		}

		//round side indents
		for (i = [[34,17,-5],[34,-17,-5],[-34,17,-5],[-34,-17,-5]]) {
			translate(i) cylinder(r=30,h=10,$fn=200);
		}

		//center hole
		translate([0,0,-4]) cylinder(r=3,h=10,$fn=200);
	}
}
