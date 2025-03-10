extends State

@export var animation: AnimationPlayer

@export var next_state: State

func enter() -> void:
	animation.play("attack")
	animation.animation_finished.connect(_on_attack_finished)

func behave(_delta) -> void:
	owner._apply_friction()

func exit() -> void:
	pass

func _on_attack_finished(_finished: StringName) -> void:
	get_parent().change_state(self,next_state)
	animation.animation_finished.disconnect(_on_attack_finished)
	
