extends Node

@export var floor_map: TileMapLayer
@export var wall_map: TileMapLayer
@export var objects: Node2D
@export var player: Player
@export var camera: Camera2D

func _ready() -> void:
	player.floor_map = floor_map
	player.shrunk.connect(embiggen_level)
	player.grew.connect(ensmallen_level)

func _process(delta: float) -> void:
	camera.position = player.position

func embiggen_level() -> void:
	var smallify_pos = wall_map.position + Vector2(0, wall_map.get_used_rect().end.y * 16 + 32)
	player.position = smallify_pos

func ensmallen_level() -> void:
	pass
