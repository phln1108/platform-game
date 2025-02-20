extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@export var speed: int = 3000
@export var jumpStrenth := 300
@export var jumps := 2
var jumpsLeft := jumps

var direction: int = 0 

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumpsLeft = jumps
		
	state_machine.change_condition("falling", velocity.y > 0)
	state_machine.change_condition("on_floor", is_on_floor())
	
	var can_jump := jumpsLeft > 0
	state_machine.change_condition("can_jump", can_jump)
	
	var jump := Input.is_action_just_pressed("jump")
	state_machine.change_condition("jump", jump)
	
	direction = int(Input.get_action_strength("right") - Input.get_action_strength("left"))
	var is_moving :=  direction != 0 
	state_machine.change_condition("is_moving", is_moving)
	
	var attack := Input.is_action_just_pressed("attack")
	state_machine.change_condition("attack", attack)
	
	state_machine._check_state_change()


func _physics_process(_delta: float) -> void:
	move_and_slide()
