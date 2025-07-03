extends State

@export var animation: Node
@export var die_queue_free: bool = true

func enter() -> void:
	animation.play("die")
	animation.animation_finished.connect(animation_ended)

func behave(_delta) -> void:
	owner._apply_friction()

func exit() -> void:
	animation.stop()
	animation.animation_finished.disconnect(animation_ended)

func animation_ended() -> void:
	animation.animation_finished.disconnect(animation_ended)
	animation.global_position = animation.global_position.round() 
	if die_queue_free:
		owner.queue_free()
	
