/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_escape)
	room_goto(TitleScreen)
	
// This controller support is a determent to my health god why
// i am so tired omg
v = 0
for (var i = 0; i < 12; i++)
{
	if gamepad_is_connected(i)
	{
		if gamepad_button_check_pressed(i, 32774) or gamepad_button_check_pressed(i, 32778)
			room_goto(TitleScreen)
		v++
	}
}
