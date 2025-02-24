extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animation := $AnimatedSprite2D
@onready var raycast := $RayCast2D

@export var speed: int = 50.0
@export var acceleration := 10.0
@export var jumpStrenth := 200
@export var jumps := 1
@export var PUSH_FORCE := 15.0
@export var MIN_PUSH_FORCE := 10.0
@export var floor_friction := 1.0

var jumpsLeft := jumps




var direction: int = 0 

func _process(delta: float) -> void:
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

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumpsLeft = jumps
	
	move_and_slide()
	handle_slide_object()
	
	if raycast.is_colliding():
		var opa = raycast.get_collider()
		
		if opa is RigidBody2D:
			print(opa.physics_material_override.friction)
			floor_friction = opa.physics_material_override.friction
		elif opa is TileMapLayer:
			var local_position = opa.to_local(raycast.get_collision_point())
			var tile_coords = opa.local_to_map(local_position)
			if not tile_coords:
				floor_friction = 1
				return
			
			var tile_data = opa.get_cell_tile_data(tile_coords)
			if not tile_data:
				floor_friction = 1
				return
			
			var tile_friction = tile_data.get_custom_data("friction")
			if not tile_friction:
				floor_friction = 1
				return
		
			floor_friction = tile_friction
			print(tile_friction)
		else:
			floor_friction = 1
				


func _apply_movement() -> void:
	#velocity.x = direction * delta * speed
	velocity = velocity.move_toward(Vector2(speed * direction, velocity.y),acceleration * floor_friction)
	if direction != 0:
		animation.flip_h = direction < 0

func _apply_friction() -> void:
	velocity = velocity.move_toward(Vector2.ZERO, acceleration * floor_friction)

func handle_slide_object() -> void:
	for i in get_slide_collision_count():
		var c := get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			#print("Collided with: ", c.get_collider())
			var push_force := (PUSH_FORCE * velocity.length() / speed) + MIN_PUSH_FORCE
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
			
