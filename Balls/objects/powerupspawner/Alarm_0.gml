/// @description Insert description here
// You can write your code in this editor

collisions = []
ctx = 0

for (var i = 0; i < instance_number(obj_collision); i++)
{
	if (	(instance_find(obj_collision, i).y > 100)
		and (instance_find(obj_collision, i).x > 200)
		and (instance_find(obj_collision, i).x < room_width - 200))
	{
		collisions[ctx] = instance_find(obj_collision,i)
		ctx++
	}
}

spawn_pos = irandom(array_length(collisions) - 1)

instance_create_layer(collisions[spawn_pos].x, collisions[spawn_pos].y - 60, "Instances", obj_speed)

alarm_set(0, 1000);