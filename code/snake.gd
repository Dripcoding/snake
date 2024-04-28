extends CharacterBody2D


@export var SPEED: float = 300


@onready var screen_size: Vector2 = get_viewport_rect().end


func _pysics(delta) -> void:
	velocity = Vector2.ZERO

	if Input.is_action_pressed("arrow_key_move_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("arrow_key_move_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("arrow_key_move_up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("arrow_key_move_down"):
		velocity.y = SPEED

	position += velocity * delta

	var collision_shape_size = get_node('CollisionShape2D').shape.size
	var offset_x = collision_shape_size.x * 1.25
	var offset_y = collision_shape_size.y * 1.25

	var position_x = clamp(position.x, Vector2.ZERO.x + offset_x, screen_size.x - offset_x)
	var position_y = clamp(position.y, Vector2.ZERO.y + offset_y, screen_size.y - offset_y)

	position = Vector2(position_x, position_y)
	
