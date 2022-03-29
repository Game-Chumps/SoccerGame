if place_meeting(x,y+1,obj_collision) hsp *= .99;

//rotate ball
if (!ballin)
	rotangle -= hsp;
else
	rotangle = (-90 + (obj_player.spaceholdtime * 1.1)) * -obj_player.image_xscale;

draw_sprite_ext(spr_ball,image_index,x,y,image_xscale,image_yscale, rotangle,c_white,1)