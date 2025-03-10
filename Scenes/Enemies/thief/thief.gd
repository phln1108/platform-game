extends Entity


var colliding_flag: bool = false

func _ready() -> void:
	direction = 1

func _on_physics_process(delta: float) -> void:
	pass
	
		
func _on_process (_delta: float) -> void:
	var is_colliding: bool=  $WallDetection.is_colliding()
	if  is_colliding and not colliding_flag:
		colliding_flag = true
		direction *= -1
		$WallDetection.target_position.x *= -1
		$DetectionArea/CollisionShape2D.position.x *= -1
		$HurtBoxComponent/CollisionShape2D.position.x *= -1
	elif not is_colliding and colliding_flag:
		colliding_flag = false
	
		
	
