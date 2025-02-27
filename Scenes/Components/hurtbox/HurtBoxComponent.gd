extends Area2D
class_name HurtBoxComponent

#signal damage

@export var attack: Attack

func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.damage()
