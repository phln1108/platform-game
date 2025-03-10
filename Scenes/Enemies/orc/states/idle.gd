extends State

@export var animation: AnimatedSprite2D
@export var next_state: State

func enter() -> void:
	animation.play("idle")
	$idle_timer.start()
func behave(_delta) -> void:
	pass

func exit() -> void:
	pass

func _on_timeout() -> void:
	get_parent().change_state(self,next_state)
