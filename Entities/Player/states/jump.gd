class_name Jump
extends PlayerState

func _enter(_msg: Dictionary={}) -> void:
	player.velocity.x = 0.0
	player.velocity_component.set_jump_velocity(-325.0)
	player.gravity_component.fall_multiplier = 1.25

func _update(_delta: float) -> void:
	pass

func _fixed_update(_delta: float) -> void:
	var move_input: Vector2 = player.movement_component.move_input
	player.velocity_component.set_horizontal_velocity(move_input.x)

	if not player.is_on_floor():
		pass

	player.velocity_component.move(player)

func _handle_input(_event: InputEvent) -> void:
	pass

func _exit() -> void:
	pass

func _transition_check() -> void:
	if player.is_on_floor():
		player.state_machine.transition("Idle")
