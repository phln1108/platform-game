extends State

@export var animation: AnimatedSprite2D

func enter() -> void:
	animation.play("crouch_idle")

func behave(_delta) -> void:
	owner._apply_friction()


func exit() -> void:
	pass
