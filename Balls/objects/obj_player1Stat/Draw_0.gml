/// @description Insert description here
// You can write your code in this editor
if !thisplayer.canCharge then {
	displayCharge = (thisplayer.charge_curr_CD / thisplayer.charge_max_CD) * 100
	draw_healthbar(thisplayer.x-35,thisplayer.y-60,thisplayer.x+35,thisplayer.y-50,displayCharge,c_blue,c_black,c_black,1,true,true)
}
