extends Area2D


signal food_eaten


func _on_body_entered(body: Node2D) -> void:
	print("body entered", body)
	food_eaten.emit()
