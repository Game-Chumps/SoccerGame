/// @description Insert description here
// You can write your code in this editor
//player movement + controller
//show_debug_message(shootcontroller.connected_gamepads)
if array_length(shootcontroller.connected_gamepads) > plcontrollernum
	plcontrollerslot = shootcontroller.connected_gamepads[plcontrollernum]
if(scoreboard.gameDone == false){
leftmove = keyboard_check(ord(key_left)) || (gamepad_axis_value(plcontrollerslot, gp_axislh) < 0);
rightmove = keyboard_check(ord(key_right)) || (gamepad_axis_value(plcontrollerslot, gp_axislh) > 0);
slam = keyboard_check_pressed(ord(key_down)) || ((gamepad_axis_value(plcontrollerslot, gp_axislv) > 0.99));
jump = keyboard_check_pressed(ord(key_up)) || (gamepad_button_check_pressed(plcontrollerslot, gp_face1));

vsp = clamp(vsp, -40, 40)

var _move = rightmove - leftmove;

if sign(_move) < 0 image_xscale = 1
if sign(_move) > 0 image_xscale = -1

if !charging hsp = _move * plwalk;

if (!canCharge) {
	charge_curr_CD -= 1;
	if charge_curr_CD <= 0 canCharge = true;
}

if (hasSpeedUp)
{
	if (powerupTimer > 0)
	{
		powerupTimer -= 1;
		hsp = _move * plwalk * 1.5
	}
	else
	{
		hasSpeedUp = false;
	}
}


vsp += grv;
if object_get_sprite(object_index) == spr_player1
{
	show_debug_message("this is the goblin player")
	if _move != 0 image_speed = 1 else image_speed = 0 //characters only animate when moving
}
else if object_get_sprite(object_index) == mr_bear or object_get_sprite(object_index) == mr_bear_holding
{
	if !plballin and _move != 0
	{
		image_speed = 1
		sprite_index = mr_bear
	}
	else if plballin and _move != 0
	{
		image_speed = 1
		sprite_index = mr_bear_holding
	}
	else if plballin and _move == 0
	{
		image_speed = 0
		sprite_index = mr_bear_holding
	}
	else
	{
		image_speed = 0
		sprite_index = mr_bear
	}
}



if !plballin spaceholdtime = 0; //if not holding ball, reset shot angle

if (!hasDblJmp)
{
	if (place_meeting(x,y+1,obj_collision)) and (jump){
		vsp = -pljump;
	}
}
else
{
	if (powerupTimer > 0)
	{
		powerupTimer -= 1;
		
		if (jump)
		{
			vsp = -pljump;
		}
	}
	else
	{
		hasDblJmp = false;
	}
}

if (slam){
	vsp = plslam;
}

//player collision (with net)
if(place_meeting(x+hsp,y,obj_collision) || place_meeting(x+hsp,y,obj_net)){
	while(!place_meeting(x+sign(hsp),y,obj_collision) and !place_meeting(x+hsp,y,obj_net)){
		x += sign(hsp);
	}
	hsp = 0;
}

if plballin{
	// Set up a timer
	timer_start += 1
	// Calculate how much to remove speed by based on log graph that functions based off time ball is held
	log_vel_punch = clamp(abs(-logn(clamp(timer_start / 650, 0, 1), abs(hsp))), 1, 25)
	// Remove velocity from player based on function location
	hsp /= abs(log_vel_punch)
}
else{
	timer_start = 0
}

x += hsp;

//vertical collision
if(place_meeting(x,y + vsp,obj_collision) || place_meeting(x,y + vsp,obj_net)){
	while(!place_meeting(x,y + sign(vsp),obj_collision) and !place_meeting(x,y + sign(vsp),obj_net)){
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

//player ball controls
if(place_meeting(x,y,obj_ball) and canball and !obj_ball.ballin and (keyboard_check_pressed(ord(key_grab)) or gamepad_button_check(plcontrollerslot, gp_face3) || gamepad_button_check(plcontrollerslot, 32773))){
		obj_ball.ballin = true;
		obj_ball.currballer = self
		plballin = true;
		canball = false;
	}
	
//tackling other players
if(place_meeting(x,y,obj_player) and charging and obj_ball.ballin){
	
		audio_play_sound(snd_crowd_ballSteal, 10, false);
		obj_ball.ballin = true;
		obj_ball.currballer = self;
		plballin = true;
		canball = false;
	}



//stun tackle
if ((keyboard_check_pressed(ord(key_tackle)) || gamepad_button_check(plcontrollerslot, gp_face3) || gamepad_button_check(plcontrollerslot, 32773) /*hardcoded value as my second controller uses some weird key id which isn't natively mapped in gml lol...*/) and canCharge and !plballin){
	audio_play_sound(snd_dash, 10, false)
	charging = true
	canCharge = false
	charge_curr_CD = charge_max_CD
	hsp = _move * plwalk * 4
	alarm[1] = 10 //tackle length
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



}