class_name StateMachine
extends Node

signal transitioned_to(state: State)

@export var initial_state: NodePath

@onready var state: State = get_node(initial_state)

var previous_state: State = null

func _ready() -> void:
	await Signal(owner, "ready")

	for child: State in get_children():
		child.state_machine = self
	state._enter()

func process_input(event: InputEvent) -> void:
	state._handle_input(event)

func update(delta: float) -> void:
	state._update(delta)

func fixed_update(delta: float) -> void:
	state._fixed_update(delta)

func check_transition() -> void:
	state._transition_check()

func transition(target_state: String, msg: Dictionary={}) -> void:
	if not has_node(target_state):
		return

	previous_state = state
	state._exit()
	state = get_node(target_state)
	state._enter(msg)
	transitioned_to.emit(state)
