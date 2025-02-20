extends Node2D
class_name HealthComponent

signal die

@export var MAX_HEALTH := 10.0
@export var show_bar_health := true

var health: float

func _ready() -> void:
	health = MAX_HEALTH
	$ProgressBar.max_value = MAX_HEALTH
	$ProgressBar.value = health
	$ProgressBar.visible = false

func damage(attack: Attack) -> void:
	health = clamp(health - attack.attack_damage,0,MAX_HEALTH)
	$ProgressBar.value = health
	if not $ProgressBar.value == MAX_HEALTH:
		$ProgressBar.visible = show_bar_health
	if health <= 0:
		die.emit()

func heal(value: float) -> void:
	health = clamp(health + value,0,MAX_HEALTH)
	$ProgressBar.value = health
	if not $ProgressBar.value == MAX_HEALTH:
		$ProgressBar.visible = show_bar_health
