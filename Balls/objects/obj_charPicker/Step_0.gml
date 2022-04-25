/// @description Insert description here
// You can write your code in this editor
x = charaselect[current_selection].x
y = charaselect[current_selection].y

show_debug_message(current_selection)

//controller controls
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
			if choosing == 1{
				players.p1Sprite = charas[current_selection]
				choosing += 1
			}
		}
	}
}

