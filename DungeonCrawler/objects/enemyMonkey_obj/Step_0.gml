
//x = mouse_x;
//y = mouse_y;

var len_x = x - obj_player.x;
var len_y = y - obj_player.y;

// State machine
if (obj_player.gameOver == false)
{
switch(state)
{
	case(monkey_state.idle):
		// Turns the sprite to the right or to the left
		if (sign(len_x) != 0) image_xscale = -sign(len_x);
		
		show_debug_message(len_x);
		// Changes sprites to look at the player's direction
		if (abs(len_x) > abs(len_y))
		{
			sprite_index = spr_monkeySide;
		}
		else
		{
			// Changes between looking up sprite and looking down
			sprite_index = sign(len_y) == 1 ? spr_monkeyUp : spr_monkeyDown;
		}
		
		if (jump_tick >= jump_timer)
		{
			rock_throw_tick = 0;
			jump_tick = 0;
			state = monkey_state.jumping;
			
			// Chooses random values for movement
			jump_height = random_range(3, 7);
			x_movement = random_range(-2, 2);
			y_movement = random_range(-2, 2);
			
		}
		
		// Throws a rock
		if (rock_throw_tick >= rock_throw_cooldown)
		{
			
			show_debug_message("rock created");
			instance_create_depth(x, y, depth, enemyRock_obj);
			rock_throw_tick = 0;
		}
		
		rock_throw_tick++;
		jump_tick++;
		break;
	case(monkey_state.jumping):
		// Moves the monkey until it falls
		var hspd = x_movement * movement_speed;
		var vspd = y_movement * movement_speed;
		
		// Collision
		if (place_meeting(x + hspd, y, obj_wall))
		{
			while (!place_meeting(x + hspd, y, obj_wall))
			{
				x += sign(hspd);
			}
			hspd = 0;
			// Changes movement direction
			x_movement *= -1;
		}
		
		x += hspd;
		
		if (place_meeting(x, y + vspd, obj_wall))
		{
			while (!place_meeting(x, y + vspd, obj_wall))
			{
				y += sign(vspd);
			}
			vspd = 0;
			
			// Changes movement direction
			y_movement *= -1;
		}
		
		y += vspd;
		
		// This will define the height in the air of the monkey
		jump_height -= grv;
		z_value = clamp(z_value + jump_height, 0, 300);
		
		// Gets back at shooting rocks
		if (z_value == 0)
		{
			state = monkey_state.idle;
		}
		break;
	
	default:
		show_debug_message("something went wrong"); //Shouldn't happen
		break;
}
}