class_name MovementController
extends Node

var move_input: Vector2:
	get:
		var input: float = Input.get_vector("left", "right", "ui_up", "ui_down").normalized().x
		return Vector2(input, 0)