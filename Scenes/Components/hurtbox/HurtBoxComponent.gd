extends Area2D
class_name HurtBoxComponent

@export var attack: Attack

func _on_area_entered(area: Area2D) -> void:
	print(area.owner.name)
	if area is HitboxComponent and area.owner != owner:
		attack.attack_position = owner.global_position
		area.damage(attack)
