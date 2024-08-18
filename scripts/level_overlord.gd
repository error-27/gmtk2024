extends Node

@export var floor_map: TileMapLayer
@export var player: Player

func _ready() -> void:
	player.floor_map = floor_map
	player.shrunk.connect(embiggen_level)
	player.grew.connect(ensmallen_level)

func embiggen_level() -> void:
	pass

func ensmallen_level() -> void:
	pass
