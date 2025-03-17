class_name Gravity
extends Component

@export var fall_multiplier: float = 4
@export var enabled: bool = true
@export var velocity_component: Velocity = null

@onready var p_gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var _entity: CharacterBody2D

var gravity: float:
	get:
		if not enabled:
			return 0.0
		return p_gravity * fall_multiplier

var is_owner_on_floor: bool:
	get:
		if not _entity:
			return false

		return _entity.is_on_floor()

func _ready() -> void:
	_entity = owner as CharacterBody2D

func _physics_process(delta: float) -> void:
	if not enabled:
		return

	if velocity_component == null:
		return

	if not is_owner_on_floor:
		velocity_component.velocity.y += gravity * delta
