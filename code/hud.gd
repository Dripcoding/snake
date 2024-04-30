extends CanvasLayer


func _on_game_over():
	print("hud game over")
	$GameStatusLabel.show()