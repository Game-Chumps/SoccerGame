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

//deadzone to make controller less frustrating
gamepad_set_axis_deadzone(0, 0.4)