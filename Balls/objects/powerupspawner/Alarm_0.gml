/// @description Insert description here
// You can write your code in this editor

collisions = []
powerups = [obj_speed, obj_dbljmp, obj_zoomball]
ctx = 0
should_run_spawner = true

for (var i = 0; i < array_length(powerups); i++)
{
	if instance_exists(powerups[i])
	{
		should_run_spawner = false
	}
}

if (should_run_spawner)
{
	// Iterate through all wall/floor collision instances
	for (var i = 0; i < instance_number(obj_collision); i++)
	{
		// Find ones that are valid for spawning
		if (	(instance_find(obj_collision, i).y > 100)
			and (instance_find(obj_collision, i).x > 200)
			and (instance_find(obj_collision, i).x < room_width - 200))
		{
			// Add valid spawn collisions to array
			collisions[ctx] = instance_find(obj_collision,i)
			ctx++
		}
	}

	// Pick random collision to spawn powerup on
	spawn_pos = irandom(array_length(collisions) - 1)
	spawn_pwrup = irandom(array_length(powerups) - 1)

	// Spawn powerup
	instance_create_layer(collisions[spawn_pos].x, collisions[spawn_pos].y - 60, "Instances", powerups[spawn_pwrup])

}

// Reset alarm
alarm_set(0, 1300);