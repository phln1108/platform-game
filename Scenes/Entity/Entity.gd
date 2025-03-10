extends CharacterBody2D
class_name Entity

@onready var state_machine: StateMachine = $StateMachine
@onready var animation := $Animation
@export  var GroundDetector: RayCast2D

@export var speed: float = 50.0
var acceleration := speed / 2 
@export var PUSH_FORCE := 15.0
@export var MIN_PUSH_FORCE := 10.0
@export var floor_friction := 1.0

@export var jumpStrenth := 200
@export var jumps := 1

var direction: int = 0 

func _process(delta: float) -> void:
	_on_process(delta)
	state_machine._check_state_change()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()
	handle_slide_object()
	
	if GroundDetector.is_colliding():
		var ground = GroundDetector.get_collider()
		
		if ground is RigidBody2D:
			#print(ground.physics_material_override.friction)
			floor_friction = ground.physics_material_override.friction
		elif ground is TileMapLayer:
			var local_position = ground.to_local(GroundDetector.get_collision_point())
			var tile_coords = ground.local_to_map(local_position)
			if not tile_coords:
				floor_friction = 1
				return
			
			var tile_data = ground.get_cell_tile_data(tile_coords)
			if not tile_data:
				floor_friction = 1
				return
			
			var tile_friction = tile_data.get_custom_data("friction")
			if not tile_friction:
				floor_friction = 1
				return
		
			floor_friction = tile_friction
		else:
			floor_friction = 1
	
	_on_physics_process(delta)

func _apply_movement() -> void:
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

## Used as physics_process function, to prevent override
func _on_physics_process(delta: float) -> void:
	pass

## Used as _process function, to prevent override
func _on_process(_delta: float) -> void:
	pass
