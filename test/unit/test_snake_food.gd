extends "res://addons/gut/test.gd"


var snake_food_scene = load("res://scenes/snake_food.tscn")


func before_each():
    var snake_food = snake_food_scene.instantiate()
    add_child(snake_food)


func after_each():
    var snake_food = get_node("SnakeFood")
    snake_food.free()


func test_snake_food_is_static_body():
    var snake_food = get_node("SnakeFood")
    assert_true(snake_food is StaticBody2D, "SnakeFood should be a StaticBody2D")