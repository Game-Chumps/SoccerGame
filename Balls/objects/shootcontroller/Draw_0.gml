if show_controller_debug{
	// DEBUG CODE FROM https://www.yoyogames.com/en/blog/coffee-break-tutorials-setting-up-and-using-gamepads-gml
	// TODO: REMOVE LATER
	draw_set_color(c_red); 
	var _num = 0;
	for (var i = 0; i < 12; i++;)
	{
	var xx = 32;
	var yy = 32 + (440 * _num);
	if gamepad_is_connected(i)
	    {
	    _num++;
	    draw_text(xx, yy, "Gamepad Slot - " + string(i));
	    draw_text(xx, yy + 20, "Gamepad Type - " + string(gamepad_get_description(i)));
	    draw_text(xx, yy + 40, "Left H Axis - " + string(gamepad_axis_value(i, gp_axislh)));
	    draw_text(xx, yy + 60, "Left V Axis - " + string(gamepad_axis_value(i, gp_axislv)));
	    draw_text(xx, yy + 80, "Right H Axis - " + string(gamepad_axis_value(i, gp_axisrh)));
	    draw_text(xx, yy + 100, "Right V Axis - " + string(gamepad_axis_value(i, gp_axisrv)));   
	    draw_text(xx, yy + 120, "Fire Rate - " + string(gamepad_button_value(i, gp_shoulderrb)));
		draw_text(xx, yy + 140, "Button 1 - " + string(gamepad_button_value(i, gp_face1)));
		draw_text(xx, yy + 160, "Button 2 - " + string(gamepad_button_value(i, gp_face2)));
		draw_text(xx, yy + 180, "Button 3 - " + string(gamepad_button_value(i, gp_face3)));
		draw_text(xx, yy + 200, "Button 4 - " + string(gamepad_button_value(i, gp_face4)));
		draw_text(xx, yy + 220, "Button 5 (GP#32773) - " + string(gamepad_button_value(i, 32773)));
		draw_text(xx, yy + 240, "Button 6 - " + string(gamepad_button_value(i, 32774)));
		draw_text(xx, yy + 260, "Button 7 - " + string(gamepad_button_value(i, 32775)));
		draw_text(xx, yy + 280, "Button 8 - " + string(gamepad_button_value(i, 32776)));
		draw_text(xx, yy + 300, "Button 9 - " + string(gamepad_button_value(i, 32777)));
		draw_text(xx, yy + 320, "Button 10 - " + string(gamepad_button_value(i, 32778)));
	    }
	}

}