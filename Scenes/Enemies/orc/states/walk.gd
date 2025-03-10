extends State

@export var animation: AnimatedSprite2D

func enter() -> void:
	animation.play("walk")

func behave(_delta) -> void:
	pass

func exit() -> void:
	pass
