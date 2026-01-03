/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(player == 2 and global.number_of_players == 1){
	var ball = instance_nearest(x, y, obj_ball);
	if (!instance_exists(ball)) exit;

	// Add a little imperfection
	reaction_offset = lerp(reaction_offset, random_range(-20, 20), 0.02);

	// Target Y position
	var target_y = ball.y + reaction_offset;

	// Move up or down
	if (abs(target_y - y) > 2) {
	    if (target_y > y) {
	        y += move_speed;
	    } else {
	        y -= move_speed;
	    }
	}

}
