extends State

@export var animation: AnimatedSprite2D


@onready var player := get_owner()

func enter() -> void:
	animation.play("walk")

func behave(_delta) -> void:
	owner.velocity.x = owner.direction * _delta * owner.speed
	animation.flip_h = owner.direction < 0

func exit() -> void:
	#player.velocity.x = 0
	pass
