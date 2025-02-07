class_name Velocity
extends Component

@export var max_speed: float = 100.0
@export var speed: float = 0.0
@export var speed_multiplier: float = 1.0

var velocity: Vector2 = Vector2.ZERO
var velocity_override: Vector2 = Vector2.ZERO
var previous_max_speed: float = 0

var acceleration_multiplier: float = 1.0

var get_max_speed: float:
	get: return max_speed * speed_multiplier

func move(character: CharacterBody2D) -> void:
	character.velocity = velocity_override if velocity_override != Vector2.ZERO else velocity
	character.move_and_slide()

func accelerate_velocity(_velocity: Vector2) -> void:
	velocity = _velocity

func accelerate_to(_direction: Vector2) -> void:
	accelerate_velocity(_direction * get_max_speed)

func set_max_speed(_speed: float) -> void:
	previous_max_speed = max_speed

	if _speed <= 0:
		printerr("Are you sure max speed should be <= 0?")

	max_speed = _speed

func set_horizontal_velocity(_speed: float) -> void:
	velocity.x = _speed * get_max_speed

func set_jump_velocity(_speed: float) -> void:
	velocity.y = _speed

func set_knockback(_direction: Vector2) -> void:
	velocity = velocity + _direction