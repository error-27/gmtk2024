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
	player.level_change.connect(level_change)


func _process(_delta: float) -> void:
	camera.position = player.position
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func embiggen_level() -> void:
	floor_map.enabled = false
	wall_map.enabled = false
	objects.hide()
	player.position = player.position * 8
	
	for t in floor_map.get_used_cells():
		var data = floor_map.get_cell_tile_data(t)
		if not data == null and not data.get_custom_data("Big Path") == "":
			var scn = load(data.get_custom_data("Big Path")).instantiate()
			add_child(scn)
			scn.position = Vector2(t.x * 16 * 8, t.y * 16 * 8)
	
	for t in wall_map.get_used_cells():
		var data = wall_map.get_cell_tile_data(t)
		if not data == null and not data.get_custom_data("Big Path") == "":
			var scn = load(data.get_custom_data("Big Path")).instantiate()
			add_child(scn)
			scn.position = Vector2(t.x * 16 * 8, t.y * 16 * 8)
	
	for o in objects.get_children():
		var scn
		if o is Box:
			scn = load("res://scenes/big_tiles/objects/box.tscn").instantiate()
		
		add_child(scn)
		scn.position = o.position * 8

func ensmallen_level() -> void:
	for child in get_children():
		child.queue_free()
	
	player.position = player.position / 8
	
	floor_map.enabled = true
	wall_map.enabled = true
	objects.show()

func level_change() -> void:
	for child in get_children():  # hide everything 
		child.queue_free()        # basically ensmallen without the smol
	objects.hide()
	var scn
	scn = load("res://scenes/player/player.tscn").instantiate()
	floor_map.hide()
	wall_map.hide()
	#player.position = player.position / 8 # change position back
	player.position = Vector2(0, 0)
	get_tree().call_deferred("change_scene_to_file", "res://scenes/level_world.tscn")# change level!
	add_child(scn)
	floor_map.show()
	wall_map.show()
	#pass

# not currently functional code
#func button_box_press() -> void:
#	print("box booped button")
#	pass
