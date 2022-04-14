/// @description Insert description here
// You can write your code in this editor

show_debug_message(current_selection)
for (var i = 0; i < 12; i++)
{
	if gamepad_is_connected(i)
	{
		if current_selection < 2
		{
			if gamepad_button_check_pressed(i, gp_padr)
				current_selection += 1
		}
		if current_selection > 0
		{
			if gamepad_button_check_pressed(i, gp_padl)
				current_selection -= 1
		}
		
		if gamepad_button_check_pressed(i, gp_face2)
			room_goto(maps[current_selection])
	}
}

if current_selection < 2
{
	if keyboard_check_pressed(vk_right)
		current_selection += 1
}
if current_selection > 0
{
	if keyboard_check_pressed(vk_left)
		current_selection -= 1
}

instance_destroy(obj_selector)
instance_create_layer(maps_locs[current_selection], 450, "Instances_1", obj_selector)

if keyboard_check_pressed(vk_enter)
	room_goto(maps[current_selection])

	
