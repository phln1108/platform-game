extends State

@export var animation: AnimatedSprite2D

@export var next_state: State

func enter() -> void:
	owner.velocity.x = 0
	animation.play("attack")
	animation.animation_finished.connect(_on_attack_finished)

func behave(_delta) -> void:
	pass

func exit() -> void:
	pass

func _on_attack_finished() -> void:
	get_parent().change_state(self,next_state)
	animation.animation_finished.disconnect(_on_attack_finished)
	
