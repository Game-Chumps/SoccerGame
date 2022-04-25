/// @description Insert description here
// You can write your code in this editor
x = mapselect[current_selection].x
y = mapselect[current_selection].y

show_debug_message(current_selection)

//controller controls
for (var i = 0; i < 12; i++)
{
	if gamepad_is_connected(i)
	{
		if current_selection >= 0 and current_selection <= 2{
			if gamepad_button_check_pressed(i, gp_padr)
				if current_selection == 2 current_selection = 0 else current_selection += 1

			if gamepad_button_check_pressed(i, gp_padl)
				if current_selection == 0 current_selection = 2 else current_selection -= 1
	
			if gamepad_button_check_pressed(i, gp_padd)
				if current_selection !=3 {
					save_select = current_selection
					current_selection = 3
					image_xscale = 0.363
					image_yscale = 0.163
				}
		}
		
		if gamepad_button_check_pressed(i, gp_padu)
			if current_selection == 3 {
				current_selection = save_select
				x = mapselect[current_selection].x//redundant code but it 
				y = mapselect[current_selection].y//looks weird without this
				image_xscale = 0.5
				image_yscale = 0.5
			}
			
		if gamepad_button_check_pressed(i, gp_face2){
			if (current_selection == 3){
				room_goto(maps[irandom(2)]) //random map
			}else{
				room_goto(maps[current_selection]) //currently selected map
			}
		}
	}
}

//keyboard controls
if current_selection >= 0 and current_selection <= 2{
	if keyboard_check_pressed(vk_right)
		if current_selection == 2 current_selection = 0 else current_selection += 1

	if keyboard_check_pressed(vk_left)
		if current_selection == 0 current_selection = 2 else current_selection -= 1
		
	if keyboard_check_pressed(vk_down){
		if current_selection !=3 {
			save_select = current_selection
			current_selection = 3
			image_xscale = 0.363
			image_yscale = 0.163
		}
	}
}

if keyboard_check_pressed(vk_up){
	if current_selection == 3 {
		current_selection = save_select
		x = mapselect[current_selection].x//redundant code but it 
		y = mapselect[current_selection].y//looks weird without this
		image_xscale = 0.5
		image_yscale = 0.5
	}
}

if keyboard_check_pressed(vk_enter){
	if (current_selection == 3){
		room_goto(maps[irandom(2)]) //random map
	}else{
		room_goto(maps[current_selection]) //currently selected map
	}
}

//mouse controls (Currently not working)
//if place_meeting(mouse_x,mouse_y,obj_RoomChallenge){
//	if (current_selection == 3){
//		x = mapselect[current_selection].x
//		y = mapselect[current_selection].y
//		image_xscale = 0.5
//		image_yscale = 0.5
//	}
//	current_selection = 0
//	if mouse_check_button_pressed(mb_left){
//		room_goto(maps[current_selection])
//	}
//}
//if place_meeting(mouse_x,mouse_y,obj_RoomFloating){
//	if (current_selection == 3){
//		x = mapselect[current_selection].x
//		y = mapselect[current_selection].y
//		image_xscale = 0.5
//		image_yscale = 0.5
//	}
//	current_selection = 1
//	if mouse_check_button_pressed(mb_left){
//		room_goto(maps[current_selection])
//	}
//}
//if place_meeting(mouse_x,mouse_y,obj_RoomBasic){
//	if (current_selection == 3){
//		x = mapselect[current_selection].x
//		y = mapselect[current_selection].y
//		image_xscale = 0.5
//		image_yscale = 0.5
//	}
//	current_selection = 2
//	if mouse_check_button_pressed(mb_left){
//		room_goto(maps[current_selection])
//	}
//}
//if place_meeting(mouse_x,mouse_y,obj_randomButton){
//	image_xscale = 0.265
//	image_yscale = 0.17
//	current_selection = 3
//	if mouse_check_button_pressed(mb_left){
//		room_goto(maps[irandom(2)])
//	}
//}

