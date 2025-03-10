extends State

@export var animation: AnimatedSprite2D

func enter() -> void:
	animation.play("crouch_walk")

func behave(_delta) -> void:
	owner._apply_movement()

func exit() -> void:
	#player.velocity.x = 0
	pass
