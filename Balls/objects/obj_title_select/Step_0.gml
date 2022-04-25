/// @description Insert description here
// You can write your code in this editor
x = optionSelect[current_selection].x
y = optionSelect[current_selection].y

show_debug_message(current_selection)

//controller controls
for (var i = 0; i < 12; i++)
{
	if gamepad_is_connected(i){
		if current_selection >= 0 and current_selection <= 3 {
			if gamepad_button_check_pressed(i, gp_padd)
				if current_selection == 3 current_selection = 0 else current_selection += 1

			if gamepad_button_check_pressed(i, gp_padu)
				if current_selection == 0 current_selection = 3 else current_selection -= 1

		
		
		if gamepad_button_check_pressed(i, gp_face2){
			switch(current_selection){
				case 0: room_goto(map_selection)
						break;
				case 1: room_goto(rm_instructions)
						break;
				case 2: room_goto(rm_credits)
						break;
				case 3: game_end()
						break;
				default: break;
			}
		}
		
		}
	}
	}
	
	//keyboard controls
if current_selection >= 0 and current_selection <= 3{
	if keyboard_check_pressed(vk_down)
		if current_selection == 3 current_selection = 0 else current_selection += 1

	if keyboard_check_pressed(vk_up)
		if current_selection == 0 current_selection = 3 else current_selection -= 1
		
}

if keyboard_check_pressed(vk_enter){
	switch(current_selection){
				case 0: room_goto(map_selection)
						break;
				case 1: room_goto(rm_instructions)
						break;
				case 2: room_goto(rm_credits)
						break;
				case 3: game_end()
						break;
				default: break;
			}
}

//display options
switch(current_selection){
				case 0: obj_startButton.image_index = 1;
						obj_instructionButton.image_index = 0;
						obj_creditButton.image_index = 0;
						obj_exitButton.image_index = 0;
						break;
			
				case 1: obj_startButton.image_index = 0;
						obj_instructionButton.image_index = 1;
						obj_creditButton.image_index = 0;
						obj_exitButton.image_index = 0; 
						break;
						
				case 2: obj_startButton.image_index = 0;
						obj_instructionButton.image_index = 0;
						obj_creditButton.image_index = 1;
						obj_exitButton.image_index = 0;
						break;
						
				case 3: obj_startButton.image_index = 0;
						obj_instructionButton.image_index = 0;
						obj_creditButton.image_index = 0;
						obj_exitButton.image_index = 1;
						break;
						
				default: obj_startButton.image_index = 0;
						obj_instructionButton.image_index = 0;
						obj_creditButton.image_index = 0;
						obj_exitButton.image_index = 0;
						break;
			}