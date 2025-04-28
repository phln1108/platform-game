extends Node2D

@export var toFollow: Node2D
@export var trackOnPath: bool = true
@export var path: Path2D
enum PathLock {None, X, Y, Both}
@export var pathLock: PathLock = PathLock.Y

func _physics_process(delta: float) -> void:
	if trackOnPath and path:
		var curve := path.curve
		var point := curve.get_closest_point(global_position)
		
		match (pathLock):
			PathLock.None: 
				pass
			PathLock.Y:
				global_position.y = point.y
				global_position.x = toFollow.global_position.x
				#print(toFollow.global_position.x ," ", curve.get_closest_point(toFollow.global_position).x)
