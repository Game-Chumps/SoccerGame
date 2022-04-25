/// @description Insert description here
// You can write your code in this editor

if !ballin{
	// Destroy current instance of ball when colliding with goal
	instance_destroy();

	audio_play_sound(snd_crowd_goal,10,false)
	obj_player.plballin = false
	obj_player2.plballin = false
	ballin = false
	lfballer = true

	scoreboard.team2Score += 1

	// Respawn ball on collision with goals
	instance_create_layer(960, 540, "Collision", obj_ball)
}
