extends State

@export var animation: AnimatedSprite2D


func enter() -> void:
	animation.play("falling")
	pass

func behave(_delta) -> void:
	owner.velocity.x = owner.direction * _delta * owner.speed
	animation.flip_h = owner.direction < 0

func exit() -> void:
	pass
