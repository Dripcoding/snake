extends "res://addons/gut/test.gd"

var obstacle_scene = load("res://scenes/obstacle.tscn")


func before_each():
	var obstacle = obstacle_scene.instantiate()
	add_child(obstacle)


func after_each():
	var obstacle = get_node("Obstacle")
	autofree(obstacle)
	assert_no_new_orphans()


func test_obstacle_is_static_body():
	var obstacle = get_node("Obstacle")
	assert_true(obstacle is Area2D, "Obstacle should be a Area2D")


func test_collided_with_obstacle_signal_emitted():
	var obstacle = get_node("Obstacle")
	var node = Node2D.new()

	watch_signals(obstacle)

	obstacle.emit_signal("body_entered", node)

	assert_signal_emitted(obstacle, "collided_with_obstacle", 'Obstacle should emit body entered signal')
	assert_signal_emit_count(obstacle, "collided_with_obstacle", 1, 'Obstacle should emit body entered signal once')

	node.free()