extends Area2D
class_name HitboxComponent

@export var health_component: HealthComponent

signal damaged

func damage(attack: Attack) -> void:
	damaged.emit()
	if health_component:
		health_component.damage(attack)
 
