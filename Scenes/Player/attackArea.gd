extends CollisionShape2D


func _process(_delta: float) -> void:
	if owner.direction != 0:
		position.x = 8 * owner.direction
