/// @description Insert description here
// You can write your code in this editor
// Destroy current instance of ball when colliding with goal
instance_destroy();

scoreboard.team1Score += 1

// Respawn ball on collision with goals
instance_create_layer(960, 540, "Collision", obj_ball)