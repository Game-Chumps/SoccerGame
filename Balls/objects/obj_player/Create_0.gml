/// @description Insert description here
// You can write your code in this editor
hsp = 0;
vsp = 0;
grv = 0.7;
plwalk = 10;
pljump = 23;
plslam = 50;
go_up = true;
charging = false;
canCharge = true;
timer_start = 0;
plcontrollerslot = -1
jump_counter = 0
image_speed = 0
instance_create_layer(0,0,"Instances",playerStats)
//deadzone to make controller less frustrating
gamepad_set_axis_deadzone(0, 0.4)
