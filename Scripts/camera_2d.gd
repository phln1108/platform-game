extends Camera2D

@export var trackOnPath: bool = true
@export var path: Path2D
enum PathLock {None, X, Y, Both}
@export var pathLock: PathLock = PathLock.X

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if trackOnPath and path:
		var curve := path.curve
		match (pathLock):
			PathLock.None: 
				pass
			PathLock.Y:
				global_position.x = curve.get_closest_point(global_position).x
