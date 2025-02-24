extends State

@export var animation: AnimatedSprite2D


@onready var player := get_owner()

func enter() -> void:
	animation.play("walk")

func behave(_delta) -> void:
	owner._apply_movement()

func exit() -> void:
	#player.velocity.x = 0
	pass
