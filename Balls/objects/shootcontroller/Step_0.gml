/// @description Insert description here
// You can write your code in this editor
v = 0
for (var i = 0; i < 12; i++)
{
	if gamepad_is_connected(i)
	{
		connected_gamepads[v] = i
		v++
	}
}

show_debug_message(connected_gamepads)