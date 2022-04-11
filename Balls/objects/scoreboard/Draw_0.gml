/// @description Insert description here
// You can write your code in this editor
scoreboard.countDownTimer = clamp(scoreboard.countDownTimer, 0, scoreboard.countDownTimer)

current_min_left = floor(scoreboard.countDownTimer / 60)
current_sec_left = floor(scoreboard.countDownTimer) - current_min_left * 60

draw_set_color(c_white)
draw_text_transformed(875, 0, "SCOREBOARD", 2, 2, 0)
draw_text_transformed(900, 25, scoreboard.team2Score, 2, 2, 0)
draw_text_transformed(1020, 25, scoreboard.team1Score, 2, 2, 0)
draw_text_transformed(500, 25, string(current_min_left) + ":" + string(current_sec_left), 2, 2, 0)


if scoreboard.countDownTimer <= 1
{
	if scoreboard.team2Score > scoreboard.team1Score
		draw_text_transformed(20, 25, "Team 1 Wins", 2, 2, 0)
	if scoreboard.team1Score > scoreboard.team2Score
		draw_text_transformed(20, 25, "Team 2 Wins", 2, 2, 0)
}
else
{
	scoreboard.countDownTimer -= delta_time / 1000000
}