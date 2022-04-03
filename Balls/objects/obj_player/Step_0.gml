/// @description Insert description here
// You can write your code in this editor
//player movement + controller
leftmove = keyboard_check(ord(key_left)) || (gamepad_axis_value(0, gp_axislh) < 0);
rightmove = keyboard_check(ord(key_right)) || (gamepad_axis_value(0, gp_axislh) > 0);
slam = keyboard_check_pressed(ord(key_down));
jump = keyboard_check_pressed(ord(key_up)) || (gamepad_button_check_pressed(0, gp_face1));

var _move = rightmove - leftmove;

if sign(_move) < 0 image_xscale = 1
if sign(_move) > 0 image_xscale = -1

hsp = _move * plwalk;

vsp += grv;

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
if(place_meeting(x,y,obj_ball) and canball){
		obj_ball.ballin = true;
		obj_ball.currballer = self
		plballin = true;
		canball = false;
	}

// Charge up angle of release
if (keyboard_check(vk_space) || gamepad_button_check(0, gp_face2))
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
	if(keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face2)){
		plballin = false;
		obj_ball.ballin = false;
		obj_ball.hsp = 20 * -image_xscale
		obj_ball.vsp -= spaceholdtime // Vertical Shot Angle
		spaceholdtime = 0 // Reset the hold time after releasing space
		obj_ball.rotangle = 0
		alarm[0] = 10; 
	}
}