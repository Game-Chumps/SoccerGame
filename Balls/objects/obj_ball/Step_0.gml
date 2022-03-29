/// @description Insert description here
// You can write your code in this editor
if(ballin == false){
	vsp += grv;

	//collision detection
	if(place_meeting(x+hsp,y,obj_collision)){
		while(!place_meeting(x+sign(hsp),y,obj_collision)){
			x += sign(hsp);
		}
		hsp *=-colldecay;
	}

	if(place_meeting(x,y + vsp,obj_collision)){
		while(!place_meeting(x,y + sign(vsp),obj_collision)){
			y += sign(vsp);
		}
		vsp *=-colldecay;
	}
	x += hsp
	y += vsp
}
if(ballin == true){
	x = obj_player.x + (30*-obj_player.image_xscale)
	y = obj_player.y + 15
}
