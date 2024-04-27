extends "res://addons/gut/test.gd"

var snake_scene = load("res://scenes/snake.tscn")


func before_each():
	var snake = snake_scene.instantiate()
	add_child(snake)


func after_each():
	var snake = get_node("Snake")
	autofree(snake)


func test_snake_is_character_body():
	var snake = get_node("Snake")
	assert_true(snake is CharacterBody2D, "Snake is not character body")
