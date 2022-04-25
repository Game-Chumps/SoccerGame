/// @description Insert description here
// You can write your code in this editor

rand = irandom(10)
show_debug_message(rand)
switch(rand)
{
	case 0:
		obj = instance_create_layer(0, 500, "Balls", obj_ball)
		obj.hspeed = 20
		break;
	case 1:
		obj = instance_create_layer(room_width, 500, "Balls", obj_ball)
		obj.hspeed = -20
		break;
	default:
		obj = instance_create_layer(random(room_width), 0, "Balls", obj_ball)
		break;
}


alarm_set(0, 90);