extends "res://addons/gut/test.gd"

var hud_scene = load("res://scenes/hud.tscn")


func before_each():
	var hud = hud_scene.instantiate()
	add_child(hud)


func after_each():
	var hud = get_node("Hud")
	autofree(hud)


func test_hud_exists():
	var hud = get_node("Hud")
	assert_not_null(hud, "HUD does not exist")


func test_hud_has_score_label():
	var hud = get_node("Hud")
	var score_label = hud.get_node("ScoreLabel")
	assert_not_null(score_label, "Score label does not exist")
	assert_true(score_label.visible, "Score label is not visible")


func test_hud_has_high_score_label():
	var hud = get_node("Hud")
	var high_score_label = hud.get_node("HighScoreLabel")
	assert_not_null(high_score_label, "High score label does not exist")
	assert_true(high_score_label.visible, "High score label is not visible")


func test_hud_has_game_status_label():
	var hud = get_node("Hud")
	var game_status_label = hud.get_node("GameStatusLabel")
	assert_not_null(game_status_label, "Game status label does not exist")
	assert_false(game_status_label.visible, "Game status label is not visible")