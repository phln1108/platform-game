# EXAMPLE NODE OF A STATE
# 1. It MUST have a change_conditions string array.
# 2. It MUST implement a behave void, wich is going to be called every frame by the state machine
extends State

@export var animation: AnimatedSprite2D

func enter() -> void:
	animation.play("idle")
	#owner.velocity.x = 0
	pass

func behave(_delta) -> void:
	owner._apply_friction()

func exit() -> void:
	pass
