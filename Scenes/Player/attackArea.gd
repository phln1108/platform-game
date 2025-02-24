extends CollisionShape2D


func _process(delta: float) -> void:
	if owner.direction != 0:
		position.x = 8 * owner.direction
