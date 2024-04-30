extends "res://addons/gut/test.gd"


var snake_scene = load("res://scenes/snake.tscn")


func before_each():
	var snake = snake_scene.instantiate()
	add_child(snake)


func after_each():
	var snake = get_node("Snake")
	autofree(snake)
	assert_no_new_orphans()


func test_snake_is_character_body():
	var snake = get_node("Snake")
	assert_true(snake is CharacterBody2D, "Snake is not character body")


func test_snake_moves_right_with_arrow_key():
	var snake = get_node("Snake")
	var original_position = snake.position

	Input.action_press("arrow_key_move_right")
	gut.simulate(snake, 1, 1)
	Input.action_release("arrow_key_move_right")
	
	var new_position = snake.position
	assert_true(new_position.x > original_position.x, "Snake did not move right")


func test_snake_moves_left_with_arrow_key():
	var snake = get_node("Snake")
	var original_position = snake.position

	Input.action_press("arrow_key_move_left")
	gut.simulate(snake, 1, 1)
	Input.action_release("arrow_key_move_left")
	
	var new_position = snake.position
	assert_true(new_position.x < original_position.x, "Snake did not move left")


func test_snake_moves_up_with_arrow_key():
	var snake = get_node("Snake")
	var original_position = snake.position

	Input.action_press("arrow_key_move_up")
	gut.simulate(snake, 1, 1)
	Input.action_release("arrow_key_move_up")

	var new_position = snake.position
	assert_true(new_position.y < original_position.y, "Snake did not move up")


func test_snake_moves_down_with_arrow_key():
	var snake = get_node("Snake")
	var original_position = snake.position

	Input.action_press("arrow_key_move_down")
	gut.simulate(snake, 1, 1)
	Input.action_release("arrow_key_move_down")

	var new_position = snake.position
	assert_true(new_position.y > original_position.y, "Snake did not move down")


func test_snake_moves_right_with_d_key():
	var snake = get_node("Snake")
	var original_position = snake.position	

	Input.action_press("d_move_right")
	gut.simulate(snake, 1, 1)
	Input.action_release("d_move_right")

	var new_position = snake.position
	assert_true(new_position.x > original_position.x, "Snake did not move right")


func test_snake_moves_left_with_a_key():
	var snake = get_node("Snake")
	var original_position = snake.position

	Input.action_press("a_move_left")
	gut.simulate(snake, 1, 1)
	Input.action_release("a_move_left")

	var new_position = snake.position
	assert_true(new_position.x < original_position.x, "Snake did not move left")


func test_snake_moves_up_with_w_key():
	var snake = get_node("Snake")
	var original_position = snake.position

	Input.action_press("w_move_up")
	gut.simulate(snake, 1, 1)
	Input.action_release("w_move_up")

	var new_position = snake.position
	assert_true(new_position.y < original_position.y, "Snake did not move up")


func test_snake_moves_down_with_s_key():
	var snake = get_node("Snake")
	var original_position = snake.position

	Input.action_press("s_move_down")
	gut.simulate(snake, 1, 1)
	Input.action_release("s_move_down")

	var new_position = snake.position
	assert_true(new_position.y > original_position.y, "Snake did not move down")


func test_snake_died_signal_emitted():
	var snake = get_node("Snake")
	
	watch_signals(snake)

	snake._on_collided_with_obstacle()

	assert_signal_emitted(snake, "snake_died")
	assert_signal_emit_count(snake, "snake_died", 1)