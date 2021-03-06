/// @description Insert description here
// You can write your code in this editor

scoreboard.countDownTimer = clamp(scoreboard.countDownTimer, 0, scoreboard.countDownTimer)

current_min_left = floor(scoreboard.countDownTimer / 60)
current_sec_left = floor(scoreboard.countDownTimer) - current_min_left * 60

if current_sec_left < 10
{
	current_sec_left = "0" + string(current_sec_left)
}
else
{
	current_sec_left = string(current_sec_left)
}

draw_set_color(c_white)

//draw_text_transformed(875, 0, "SCOREBOARD", 2, 2, 0)
draw_text_transformed(room_width/2 - 135, 10, scoreboard.team2Score, 2, 2, 0)
draw_text_transformed(room_width/2 + 118, 10, scoreboard.team1Score, 2, 2, 0)

draw_text_transformed(room_width/2 - 35, 10, string(current_min_left) + ":" + string(current_sec_left), 2, 2, 0)

if scoreboard.countDownTimer <= 1
{
	
	if scoreboard.team2Score > scoreboard.team1Score{
		instance_create_layer(960,540, "Winner", obj_playerOneWins);
		obj_playerOneWins.image_xscale = 2.045661
		obj_playerOneWins.image_yscale = 2.045661
	}
		//draw_text_transformed(1020, 50, "Team 1 Wins", 2, 2, 0)
	if scoreboard.team1Score > scoreboard.team2Score{
		instance_create_layer(960,540, "Winner", obj_playerTwoWins);
		obj_playerTwoWins.image_xscale = 2.045661
		obj_playerTwoWins.image_yscale = 2.045661
	}
		//draw_text_transformed(1020, 50, "Team 2 Wins", 2, 2, 0)
	if scoreboard.team1Score == scoreboard.team2Score{
		instance_create_layer(960,540, "Winner", obj_tie);
		obj_tie.image_xscale = 2.045661
		obj_tie.image_yscale = 2.045661
	}
	instance_create_layer(960, 860, "Winner", obj_rematch)
		//draw_text_transformed(1020, 50, "It's a Tie!", 2, 2, 0)
	gameDone = true;
	
	
	
}
else
{
	scoreboard.countDownTimer -= delta_time / 1000000
	gameDone = false;
}

