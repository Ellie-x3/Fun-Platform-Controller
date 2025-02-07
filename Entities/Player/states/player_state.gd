class_name PlayerState
extends State

var player: Player

func _ready() -> void:
	await Signal(owner, "ready")
	player = owner as Player
