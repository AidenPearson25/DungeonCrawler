
// Sets the amount of seconds to jump
jump_timer = 3 /*<< Seconds */ * room_speed;
jump_tick = 0;

rock_throw_cooldown = 1.5 /*<< Seconds */ * room_speed;
rock_throw_tick = 0;

// Sets the current state of the monkey
enum monkey_state
{
	idle,
	jumping
}
state = monkey_state.idle;

// Movement variables
jump_height = 0; // Jump height is a variable set randomly, it defines the amount of time the monkey will be on air
grv = 0.2;

x_movement = 0;
y_movement = 0;
z_value = 0;

movement_speed = 1.5;