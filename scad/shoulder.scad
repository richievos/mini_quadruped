//9g generic
shoulder(26,5.5,3.5,2,13);
//tower servo
translate([0,20,0]) shoulder(27,7,3.6,1.75,14);


module shoulder(servo_tall_gap,servo_inside_clearance,horn_radius1,horn_radius2,horn_distance_between_radii){
	//bottom plate constants
	plate_thick = 3.5;
	offset_x = 4; offset_y = 4;
	m3_screw_dia = 3;
	m3_screw_head_dia = 7;
	m3_screw_head_height = 1.75;
	m3_nut_wrench_size = 6.5;
	m3_nut_height = 1.75;

	//calc'd starts
	ch_servo_tall_gap = (servo_tall_gap/2)-1;
	hr_servo_tall_gap = -((servo_tall_gap/2)+6);

	horn_height = servo_inside_clearance+14.15;

	//channel bracket
	difference(){
		union(){
			//vert wall
			translate([ch_servo_tall_gap,-8,0]) cube([6,16,horn_height+.35]);
			//round top
			translate([ch_servo_tall_gap,0,horn_height+.35]) rotate([0,90,0]) cylinder(r=8, h=6, $fn=100);
		}
		// button hole bottom
		translate([ch_servo_tall_gap,0,horn_height]) rotate([0,90,0]) cylinder(r=3,h=6,$fn=100);		
		// button hole top
		translate([ch_servo_tall_gap-2,0,horn_height-.1]) rotate([0,90,0]) cylinder(r=5.6,h=3,$fn=100);	
		//bottom channel
		translate([ch_servo_tall_gap+5,-5,-1]) cube([2,10,30]);
	}
	
	//horn bracket
	difference(){
		union(){
			//vert wall
			translate([hr_servo_tall_gap,-8,0]) cube([5,16,horn_height+.35]);
			//round top
			translate([hr_servo_tall_gap,0,horn_height+.35]) rotate([0,90,0]) cylinder(r=8, h=5, $fn=100);
		}
		//servo horn hole
		translate([hr_servo_tall_gap,0,horn_height]) rotate([0,90,0]) cylinder(r=horn_radius1,h=6,$fn=100);
		//servo horn channel
		hull(){	
			//top channel
			translate([hr_servo_tall_gap-1,-3.5,horn_height]) cube([3,7,9]);
			//large round
			translate([hr_servo_tall_gap-1,0,horn_height]) rotate([0,90,0]) cylinder(r=horn_radius1,h=3,$fn=100);	
			//small round
			translate([hr_servo_tall_gap-1,0,horn_height-horn_distance_between_radii]) rotate([0,90,0]) cylinder(r=horn_radius2,h=3,$fn=100);
		}
	}

	
	
	
	difference(){
		//main plate
		translate([-19,-8,0]) cube([37,16,plate_thick]);
		//screw holes
		for (i = [[offset_x-.5,offset_y,-1],[offset_x-.5,-offset_y,-1],[-offset_x-.5,offset_y,-1],[-offset_x-.5,-offset_y,-1]]){	
			translate(i) cylinder(r=m3_screw_dia/2, h=plate_thick+2, $fn=20);
		}
		//screw head holes
		for (i = [[offset_x-.5,-offset_y,plate_thick-m3_screw_head_height+.1],[-offset_x-.5,-offset_y,plate_thick-m3_screw_head_height+.1]]){
			translate(i) cylinder(r=m3_screw_head_dia/2, h=m3_screw_head_height, $fn=20);
		}
		//nut traps
		for (i = [[offset_x-.5,offset_y,plate_thick-m3_nut_height+.1],[-offset_x-.5,offset_y,plate_thick-m3_nut_height+.1]]){
			translate(i) cylinder(r=m3_nut_wrench_size/2, h=m3_nut_height, $fn=6);
		}
	}
}
