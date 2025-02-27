extends Node2D
class_name LightSource

## Maximum level of energy value of the light source
@export var max_energy : float = 1.2

## Minimum level of energy value of the light source
@export var min_energy : float = .8

## This variable controls the animation lerp, dont need to change this
@export var delta_energy : float = 0

func _ready() -> void:
	_on_ready()
	var delay_time := randf() 
	print(delay_time)
	await get_tree().create_timer(delay_time).timeout
	$AnimationPlayer.play("glow")

func _process(delta: float) -> void:
	_on_process(delta)
	$PointLight2D.energy = min_energy + (max_energy - min_energy) * delta_energy

func _on_process(_delta: float) -> void:
	pass

func _on_ready() -> void:
	pass
