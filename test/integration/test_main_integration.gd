extends "res://addons/gut/test.gd"


var main_scene = load("res://scenes/main.tscn")


func before_each():
    var main = main_scene.instantiate()
    add_child(main)


func after_each():
    var main = get_node("Main")
    autofree(main)
    assert_no_new_orphans()


func test_snake_died_signal_emited_when_snake_collides_with_obstacle():
    var snake = get_node("Main/Snake")
    var obstacle = get_node("Main/Obstacle")

    watch_signals(obstacle)
    watch_signals(snake)

    snake.set_global_position(obstacle.position)

    await wait_for_signal(obstacle.collided_with_obstacle, 1)
    assert_signal_emitted(obstacle, "collided_with_obstacle")
    assert_signal_emit_count(obstacle, "collided_with_obstacle", 1)

    await wait_for_signal(snake.snake_died, 1)
    assert_signal_emitted(snake, "snake_died")
    assert_signal_emit_count(snake, "snake_died", 1)


func test_game_over_signal_emitted_when_snake_dies():
    var main = get_node("Main")
    var snake = get_node("Main/Snake")
    var obstacle = get_node("Main/Obstacle")

    watch_signals(obstacle)
    watch_signals(snake)
    watch_signals(main)

    snake.set_global_position(obstacle.position)

    await wait_for_signal(obstacle.collided_with_obstacle, 1)
    assert_signal_emitted(obstacle, "collided_with_obstacle")
    assert_signal_emit_count(obstacle, "collided_with_obstacle", 1)

    await wait_for_signal(snake.snake_died, 1)
    assert_signal_emitted(snake, "snake_died")
    assert_signal_emit_count(snake, "snake_died", 1)

    await wait_for_signal(main.game_over, 1)
    assert_signal_emitted(main, "game_over")
    assert_signal_emit_count(main, "game_over", 1)


func test_game_over_label_shown_when_snake_dies():
    var main = get_node("Main")
    var snake = get_node("Main/Snake")
    var obstacle = get_node("Main/Obstacle")
    var game_status_label = get_node("Main/Hud/GameStatusLabel")

    snake.set_global_position(obstacle.position)

    await wait_for_signal(obstacle.collided_with_obstacle, 1)
    await wait_for_signal(snake.snake_died, 1)
    await wait_for_signal(main.game_over, 1)

    assert_true(game_status_label.visible)

