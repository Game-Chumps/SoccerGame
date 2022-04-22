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
	if (zoomin)
	{
		if (powerupTimer > 0)
		{
			x += hsp * 1.75
		}
		else
		{
			zoomin = false
		}
	}
	else
	{
		x += hsp
	}
	y += vsp
}

if(ballin == true){
	if lfballer{
		lfballer = false
	}
}