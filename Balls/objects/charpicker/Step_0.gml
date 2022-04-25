/// @description Insert description here
// You can write your code in this editor
x = charselect[current_selection].x
y = charselect[current_selection].y

show_debug_message(current_selection)

//controller controls
if (playerpicking == 0){
	obj_p1.sprite_index = chars[current_selection]
	for (var i = 0; i < 12; i++)
	{
		if gamepad_is_connected(i)
		{
			if current_selection >= 0 and current_selection <= 1{
				if gamepad_button_check_pressed(i, gp_padr)
					if current_selection == 1 current_selection = 0 else current_selection += 1

				if gamepad_button_check_pressed(i, gp_padl)
					if current_selection == 0 current_selection = 1 else current_selection -= 1
			}
			
			if gamepad_button_check_pressed(i, gp_face2) and canPick{
				obj_spriteholder1.spritehold = chars[current_selection]
				canPick = false
				alarm_set(0,1)
				playerpicking += 1
			}
		}
	}
	
	if current_selection >= 0 and current_selection <= 1{
		if keyboard_check_pressed(vk_right)
			if current_selection == 1 current_selection = 0 else current_selection += 1

		if keyboard_check_pressed(vk_left)
			if current_selection == 0 current_selection = 1 else current_selection -= 1
	}
	if keyboard_check_pressed(vk_enter) and canPick{
		obj_spriteholder1.spritehold = chars[current_selection]
			canPick = false
			alarm_set(0,1)
			playerpicking += 1
	}
}

if (playerpicking == 1){
	if chars[current_selection] == obj_p1.sprite_index {
		obj_p2.sprite_index = altchars[current_selection]
	}else{
		obj_p2.sprite_index = chars[current_selection]
	}
	
	for (var i = 0; i < 12; i++)
	{
		if gamepad_is_connected(i)
		{
			if current_selection >= 0 and current_selection <= 1{
				if gamepad_button_check_pressed(i, gp_padr)
					if current_selection == 1 current_selection = 0 else current_selection += 1

				if gamepad_button_check_pressed(i, gp_padl)
					if current_selection == 0 current_selection = 1 else current_selection -= 1
			}
			if gamepad_button_check_pressed(i, gp_face2) and canPick{
				if obj_spriteholder1.spritehold == chars[current_selection]{
					obj_spriteholder2.spritehold = altchars[current_selection]
					room_goto(map_selection)
				}else{
					obj_spriteholder2.spritehold = chars[current_selection]
					room_goto(map_selection)
				}
			}
		}
	}
	
	if current_selection >= 0 and current_selection <= 1{
		if keyboard_check_pressed(vk_right)
			if current_selection == 1 current_selection = 0 else current_selection += 1

		if keyboard_check_pressed(vk_left)
			if current_selection == 0 current_selection = 1 else current_selection -= 1
	}
	if keyboard_check_pressed(vk_enter) and canPick{
		if obj_spriteholder1.spritehold == chars[current_selection]{
			obj_spriteholder2.spritehold = altchars[current_selection]
			room_goto(map_selection)
		}else{
			obj_spriteholder2.spritehold = chars[current_selection]
			room_goto(map_selection)
		}
	}
}




