/// @description Insert description here
// You can write your code in this editor

spawn_x = random(room_height - 300) + 150
spawn_y = random(room_width - 300) + 150

collisions = []

for (var i = 0; i < instance_number(obj_collision); i++)
{
	collisions[i] = instance_find(obj_collision,i)
}

instance_create_layer(spawn_x, spawn_y, "Instances", obj_speed)

alarm_set(0, 90);