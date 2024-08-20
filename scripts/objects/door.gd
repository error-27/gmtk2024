extends StaticBody2D
class_name Door

@export var button_coord: Vector2i
@export var seamless := false
@onready var objects = $".."
@onready var door_tile : Sprite2D = $Sprite2D

func _ready() -> void:
	if seamless:
		$Sprite2D.modulate = Color(1, 0, 0.929)
	for child in objects.get_children():
		if child is Button_Box:
			child.button_press.connect(open_door)

func open_door(coord: Vector2i) -> void:
	if coord == button_coord:
		$CollisionShape2D.disabled = true
		door_tile.hide()
		seamless = false
