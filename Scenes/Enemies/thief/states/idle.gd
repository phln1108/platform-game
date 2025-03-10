extends State

@export var animation: AnimatedSprite2D
@export var next_state: State

func enter() -> void:
	animation.play("idle")
	$Timer.start()
	$Timer.timeout.connect(on_timeout)

func behave(_delta) -> void:
	pass

func exit() -> void:
	$Timer.stop()
	$Timer.timeout.disconnect(on_timeout)
	

func on_timeout() -> void:
	get_parent().change_state(self,next_state)
	

	
