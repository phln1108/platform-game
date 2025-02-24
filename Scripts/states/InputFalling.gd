extends State

@export var animation: AnimatedSprite2D


func enter() -> void:
	animation.play("falling")
	pass

func behave(_delta) -> void:
	owner._apply_movement()


func exit() -> void:
	pass
