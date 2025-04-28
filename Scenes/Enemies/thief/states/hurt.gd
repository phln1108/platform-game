extends State

@export var animation : AnimatedSprite2D
@export var next_state: State

func enter() -> void:
	animation.play("hurt")
	animation.animation_finished.connect(animation_ended)
	pass

func behave(_delta) -> void:
	if owner.is_on_floor():
		owner._apply_friction()
	pass

func exit() -> void:
	animation.stop()
	animation.animation_finished.disconnect(animation_ended)

func animation_ended() -> void:
	animation.animation_finished.disconnect(animation_ended)
	get_parent().change_state(self,next_state)
	
	
