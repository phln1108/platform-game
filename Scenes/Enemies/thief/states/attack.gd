extends State

@export var animation: AnimationPlayer
@export var next_state: State

func enter() -> void:
	animation.play("attack")
	animation.animation_finished.connect(on_animation_finished)

func behave(_delta) -> void:
	owner._apply_friction()

func exit() -> void:
	animation.stop()
	animation.animation_finished.disconnect(on_animation_finished)

func on_animation_finished(_current_animation: String ) -> void:
	get_parent().change_state(self,next_state)
