extends Node2D
class_name LightSource

func _ready() -> void:
	_on_ready()
	var delay_time := randf() 
	print(delay_time)
	await get_tree().create_timer(delay_time).timeout
	$AnimationPlayer.play("glow")

func _on_ready() -> void:
	pass
