extends Node2D

@export var toFollow: Node2D
@export var trackOnPath: bool = true
@export var path: Path2D
enum PathLock {None, X, Y, Both}
@export var pathLock: PathLock = PathLock.Y


func start_tracking() -> void:
	if trackOnPath and path:
		var curve := path.curve
		var point := curve.get_closest_point(toFollow.global_position)
		match (pathLock):
			PathLock.None:
				global_position.y = toFollow.global_position.y
				global_position.x = toFollow.global_position.x
				
			PathLock.Y:
				print("lock on y")
				global_position.y = point.y
				global_position.x = toFollow.global_position.x
				
			PathLock.X:
				global_position.x = point.x
				global_position.y = toFollow.global_position.y

func _ready() -> void:
	start_tracking()

func _physics_process(delta: float) -> void:
	if trackOnPath and path:
		var curve := path.curve
		var point := curve.get_closest_point(global_position)
		
		match (pathLock):
			PathLock.None: 
				pass
			PathLock.Y:
				var distanceFromFollower := point.x - toFollow.global_position.x
				#$RichTextLabel.text = str(snapped(distanceFromFollower, 0.001))
				if 1 > distanceFromFollower and distanceFromFollower > -1:
					global_position.y = point.y
					global_position.x = toFollow.global_position.x
