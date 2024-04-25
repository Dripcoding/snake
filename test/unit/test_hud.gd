extends "res://addons/gut/test.gd"

var hud_scene = load("res://scenes/hud.tscn")

func before_each():
    var hud = hud_scene.instantiate()
    add_child(hud)

func after_each():
    var hud = get_node("Hud")
    hud.free()

func test_hud_exists():
    var hud = get_node("Hud")
    assert_not_null(hud, "HUD does not exist")

func test_hud_has_score_label():
    var hud = get_node("Hud")
    var score_label = hud.get_node("ScoreLabel")
    assert_not_null(score_label, "Score label does not exist")

func test_hud_has_high_score_label():
    var hud = get_node("Hud")
    var high_score_label = hud.get_node("HighScoreLabel")
    assert_not_null(high_score_label, "High score label does not exist")