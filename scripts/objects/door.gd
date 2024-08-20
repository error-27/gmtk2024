extends StaticBody2D

@export var button_coord: Vector2i
@onready var objects = $".."

func _ready() -> void:
	for child in objects.get_children():
		if child is Button_Box:
			child.button_press.connect(open_door)

func open_door(coord: Vector2i) -> void:
	if coord == button_coord:
		$CollisionShape2D.disabled = true
