class_name Walk
extends PlayerState

func _enter(_msg: Dictionary={}) -> void:
	pass

func _update(_delta: float) -> void:
	pass

func _fixed_update(_delta: float) -> void:
	var move_input: Vector2 = player.movement_component.move_input
	player.velocity_component.set_horizontal_velocity(move_input.x)
	player.velocity_component.move(player)

func _handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("Jump"):
		state_machine.transition("Jump")

func _exit() -> void:
	player.velocity_component.set_horizontal_velocity(0)

func _transition_check() -> void:
	if player.movement_component.move_input == Vector2.ZERO:
		state_machine.transition("Idle")
