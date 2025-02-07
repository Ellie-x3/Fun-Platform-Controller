class_name Idle
extends PlayerState

func _enter(_msg: Dictionary={}) -> void:
    player.velocity_component.velocity = Vector2.ZERO

func _update(_delta: float) -> void:
    pass

func _fixed_update(_delta: float) -> void:
    pass

func _handle_input(_event: InputEvent) -> void:
    pass

func _exit() -> void:
    pass

func _transition_check() -> void:
    if player.movement_component.move_input != Vector2.ZERO:
        state_machine.transition("Walk")


