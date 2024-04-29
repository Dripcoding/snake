extends "res://addons/gut/test.gd"

var snake_food_scene = load("res://scenes/snake_food.tscn")


func before_each():
	var snake_food = snake_food_scene.instantiate()
	add_child(snake_food)


func after_each():
	var snake_food = get_node("SnakeFood")
	autofree(snake_food)


func test_snake_food_is_static_body():
	var snake_food = get_node("SnakeFood")
	assert_true(snake_food is Area2D, "SnakeFood should be a StaticBody2D")


func test_food_eaten_signal_emitted():
	var snake_food = get_node("SnakeFood")
	var node = Node2D.new()
	
	watch_signals(snake_food)

	snake_food.emit_signal("body_entered", node)

	assert_signal_emitted(snake_food, "food_eaten", "food_eaten signal should be emitted when body enters the area")
	assert_signal_emit_count(snake_food, "food_eaten", 1, "food_eaten signal should be emitted only once")

	node.free()