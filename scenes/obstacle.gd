extends Area2D


signal collided_with_obstacle


func _on_body_entered(body:Node2D) -> void:
	print('body entered')
	collided_with_obstacle.emit()
	body.queue_free()

