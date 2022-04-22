if (zoomin)
{
	dirvsp = round(round(vsp / 1.5) * 1.5)
	dirhsp = round(round(hsp / 1.5) * 1.5)

	zoomdir = point_direction(x, y, x-dirvsp, y+dirhsp)
}

if place_meeting(x,y+1,obj_collision) hsp *= .99;
//rotate ball
if (!ballin)
	rotangle -= hsp;
else
{
	rotangle = (-90 + (currballer.spaceholdtime * 1.1)) * -currballer.image_xscale;
	if (zoomin)
		zoomdir = rotangle
}


draw_sprite_ext(spr_ball,image_index,x,y,image_xscale,image_yscale, rotangle,c_white,1)

if (zoomin)
	draw_sprite_ext(spr_fire,image_index,x,y,image_xscale,image_yscale, zoomdir,c_white,1)