extends "res://addons/gut/test.gd"

var obstacle_scene = load("res://scenes/obstacle.tscn")


func before_each():
	var obstacle = obstacle_scene.instantiate()
	add_child(obstacle)


func after_each():
	var obstacle = get_node("Obstacle")
	obstacle.free()


func test_obstacle_is_static_body():
	var obstacle = get_node("Obstacle")
	assert_true(obstacle is StaticBody2D, "Obstacle should be a StaticBody2D")
