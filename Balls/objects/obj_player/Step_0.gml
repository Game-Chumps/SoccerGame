/// @description Insert description here
// You can write your code in this editor
//player movement + controller
leftmove = keyboard_check(ord(key_left)) || (gamepad_axis_value(plcontrollerslot, gp_axislh) < 0);
rightmove = keyboard_check(ord(key_right)) || (gamepad_axis_value(plcontrollerslot, gp_axislh) > 0);
slam = keyboard_check_pressed(ord(key_down));
jump = keyboard_check_pressed(ord(key_up)) || (gamepad_button_check_pressed(plcontrollerslot, gp_face1));

var _move = rightmove - leftmove;

if sign(_move) < 0 image_xscale = 1
if sign(_move) > 0 image_xscale = -1

if !charging hsp = _move * plwalk;

vsp += grv;

if !plballin spaceholdtime = 0; //if not holding ball, reset shot angle

if (place_meeting(x,y+1,obj_collision)) and (jump){
	vsp = -pljump;
}

if (slam){
	vsp = plslam;
}

//player collision
if(place_meeting(x+hsp,y,obj_collision)){
	while(!place_meeting(x+sign(hsp),y,obj_collision)){
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

if(place_meeting(x,y + vsp,obj_collision)){
	while(!place_meeting(x,y + sign(vsp),obj_collision)){
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

//player ball controls
if(place_meeting(x,y,obj_ball) and canball and !obj_ball.ballin){
		obj_ball.ballin = true;
		obj_ball.currballer = self
		plballin = true;
		canball = false;
	}
	
//tackling other players
if(place_meeting(x,y,obj_player) and charging and obj_ball.ballin){
		obj_ball.ballin = true;
		obj_ball.currballer = self;
		plballin = true;
		canball = false;
	}



//stun tackle
if (keyboard_check_pressed(ord(key_tackle)) and canCharge and !plballin){
	charging = true
	canCharge = false
	hsp = _move * plwalk * 4
	alarm[1] = 10 //tackle length
	alarm[2] = 300 //tackle CD
}



// Charge up angle of release
if (keyboard_check(key_shoot) || gamepad_button_check(plcontrollerslot, gp_face2) and plballin)
{
	if spaceholdtime == 0
		go_up = true
	if spaceholdtime == 75
		go_up = false

	if go_up
		spaceholdtime = clamp(spaceholdtime + 1, 0, 75)
	if !go_up
		spaceholdtime = clamp(spaceholdtime - 1, 0, 75)
}

if(plballin){
	obj_ball.x = x + (30*-image_xscale)
	obj_ball.y = y + 15
	if(keyboard_check_released(key_shoot) || gamepad_button_check_released(plcontrollerslot, gp_face2) and plballin){
		plballin = false;
		obj_ball.ballin = false;
		obj_ball.hsp = 20 * -image_xscale
		obj_ball.vsp -= spaceholdtime // Vertical Shot Angle
		obj_ball.rotangle = 0
		canball = false; //Ensures the player can't pick up the ball immediately
		alarm[0] = 10; 
	}
}