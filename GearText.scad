/************************************************************************
 *		GearText
 *		
 *		Author: 	Zanion
 *		Date:		02/22/2014
 *
 *		Description:	GearText is a tool built for the Oregon Tech PRINT3D
 *							robotics lab. This tool was born from the need to
 * 						quickly and easily write custom font to the face
 *							of gears.
 *
 ************************************************************************/
use <lib\Write.scad>

/************************************************************************
 *		Module:	SolidLargeGear()
 *		Purpose: Loads and generates a smooth face wade's extruder herringbone
					large gear
 * 	Input: none| none
 *
 ************************************************************************/
module SolidLargeGear(){
	center_hole_rad=4.5;
	center_hole_height=10;
	inner_ring_height=6;
	inner_ring_rad=30;

	union(){
		import(".\\Models\\biggearmod_fixed_1.stl");
		difference(){
			cylinder(h=inner_ring_height,r=inner_ring_rad);
			translate([0,0,-1])cylinder(h=center_hole_height,r=center_hole_rad);
		}				
	}
}

/************************************************************************
 *		Module:	WriteUpperGear(text)
 *		Purpose: Writes selected text on upper
 *					gear face.
 * 	Input: text| Text to write to top of gear
 *
 ************************************************************************/
module WriteUpperGear(text){
	translate([0,0,-7])
		writecylinder(text,t=10,h=10,[0,0,0],30,20,face="top",center=true,font="Fonts\\Letters.dxf", space=1.2);

}

/************************************************************************
 *		Generate Model
 ************************************************************************/

SolidLargeGear();
WriteUpperGear("BIG RED");

