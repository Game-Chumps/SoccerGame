/// @description Insert description here
// You can write your code in this editor

ballss = []
randomize()

for (var i = 0; i < instance_number(obj_ball); i++)
{
	ballss[i] = instance_find(obj_ball, i)
}

if (array_length(ballss) < 8)
{
	rand = irandom(10)
	switch(rand)
	{
		default:
			if (rand % 5 == 0)
			{
				obj = instance_create_layer(room_width, 500, "Balls", obj_ball)
				obj.hspeed = -15
				obj = instance_create_layer(0, 500, "Balls", obj_ball)
				obj.hspeed = 15
			}
			
			obj = instance_create_layer(random(room_width), 0, "Balls", obj_ball)
			break;
	}
}

alarm_set(0, 100);