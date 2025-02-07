class_name Player
extends CharacterBody2D

@onready var velocity_component: Velocity = %Velocity
@onready var movement_component: MovementController = %Movement
@onready var state_machine: StateMachine = %StateMachine

func _process(delta: float) -> void:
    state_machine.update(delta)

func _physics_process(delta: float) -> void:
    state_machine.fixed_update(delta)
    state_machine.check_transition()