extends Resource
class_name Attack

@export var attack_damage  : float = 1

##impulse apllied to the target
@export var attack_knocback: Vector2 = Vector2(50,70)

## time in seconds to apply stun
@export var stun_time: float

## this position is relative to the attacker when the attack occurs, the value here will be ignored
@export var attack_position: Vector2
