/// @description Insert description here
// You can write your code in this editor
//getting hit by tackle DOESNT WORK UGHHHHHH
if(place_meeting(x,y,obj_player) and other.charging and plballin){
		plballin = false;
		canball = false; //Ensures the player can't pick up the ball immediately
		alarm[0] = 20;
		spaceholdtime = 0;
	}