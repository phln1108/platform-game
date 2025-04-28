extends Node

func _ready() -> void:
	Engine.physics_ticks_per_second = 480
	Engine.max_physics_steps_per_frame = 30
