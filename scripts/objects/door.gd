extends StaticBody2D

@export var button: Node2D

func _ready() -> void:
	button.pressed.connect()

func open_door() -> void:
	$CollisionShape2D.disabled = true
