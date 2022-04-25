/// @description Insert description here
// You can write your code in this editor
x = charselect[current_selection].x
y = charselect[current_selection].y



show_debug_message(current_selection)

//controller controls
if (playerpicking == 1){
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
			
			if gamepad_button_check_pressed(i, gp_face2){
					obj_spriteholder.p1Sprite = chars[current_selection]
					playerpicking += 1
			}
		}
	}
}


if (playerpicking == 2){
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
			
			if gamepad_button_check_pressed(i, gp_face2){
				if obj_spriteholder.p1Sprite == chars[current_selection]{
						obj_spriteholder.p2Sprite = altchars[current_selection]	
				}else{
						obj_spriteholder.p2Sprite = chars[current_selection]
				}
			}
		}
	}
}


