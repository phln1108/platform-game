extends State

@export var animation: AnimatedSprite2D

func enter() -> void:
	animation.play("jump")
	owner.jumps -= 1
	owner.velocity.y = -owner.jumpStrenth

func behave(_delta) -> void:
	owner._apply_movement()
	if Input.is_action_just_released("jump") and owner.velocity.y < 0:
		owner.velocity.y /=  2

func exit() -> void:
	pass
