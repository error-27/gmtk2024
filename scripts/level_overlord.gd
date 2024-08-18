extends Node2D

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
	floor_map.enabled = false
	wall_map.enabled = false
	objects.hide()
	var smallify_pos = wall_map.position + Vector2(0, wall_map.get_used_rect().end.y * 16 + 32)
	player.position = smallify_pos
	
	for t in floor_map.get_used_cells():
		var data = floor_map.get_cell_tile_data(t)
		if not data == null and not data.get_custom_data("Big Path") == "":
			var scn = load(data.get_custom_data("Big Path")).instantiate()
			add_child(scn)
			scn.position = smallify_pos + Vector2(t.x * 16 * 8, t.y * 16 * 8)
	
	for t in wall_map.get_used_cells():
		var data = wall_map.get_cell_tile_data(t)
		if not data == null and not data.get_custom_data("Big Path") == "":
			var scn = load(data.get_custom_data("Big Path")).instantiate()
			add_child(scn)
			scn.position = smallify_pos + Vector2(t.x * 16 * 8, t.y * 16 * 8)

func ensmallen_level() -> void:
	floor_map.enabled = false
	wall_map.enabled = false
	objects.show()
	for child in get_children():
		child.queue_free()
