extends Node2D


signal game_over



func _on_snake_died() -> void:
	print('game over')
	game_over.emit()