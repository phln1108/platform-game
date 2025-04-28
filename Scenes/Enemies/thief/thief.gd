extends Entity

var colliding_flag: bool = false

func _ready() -> void:
	direction = 1
	$HurtBoxComponent/CollisionShape2D.disabled = true

func _on_physics_process(_delta: float) -> void:
	pass

func _on_process (_delta: float) -> void:
	state_machine.change_condition("on_floor", is_on_floor())
	pass

func _on_detection_area_entered(area: Area2D) -> void:
	if area is HitboxComponent and area.owner is Player:
		state_machine.change_condition("attack", true)

func _on_detection_area_area_exited(area: Area2D) -> void:
	if area is HitboxComponent and area.owner is Player:
		state_machine.change_condition("attack", false)

func handle_change_direction() -> void:
	var is_colliding: bool=  $WallDetection.is_colliding()
	if  is_colliding and not colliding_flag:
		colliding_flag = true
		direction *= -1
		$WallDetection.target_position.x *= -1
		$DetectionArea/CollisionShape2D.position.x *= -1
		$HurtBoxComponent/CollisionShape2D.position.x *= -1
	elif not is_colliding and colliding_flag:
		colliding_flag = false
