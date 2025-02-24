extends State

@export var animation: AnimatedSprite2D

#var player = get_parent().get_parent()

func enter() -> void:
	animation.play("jump")
	owner.velocity.y = -owner.jumpStrenth
	owner.jumpsLeft -= 1

func behave(_delta) -> void:
	owner._apply_movement()


func exit() -> void:
	pass
