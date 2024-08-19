extends CharacterBody2D
class_name Player

@export var big_speed: int = 20
@export var small_speed: int = 5

var floor_map: TileMapLayer

var is_small := false

@onready var collider := $CollisionShape2D
var looking = 0
signal shrunk
signal grew

func _ready() -> void:
	var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
	pass

func _process(_delta: float) -> void:
	var h_move := int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var v_move := int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = Vector2(h_move, v_move) * (small_speed if is_small else big_speed)
	
	if velocity == Vector2():
		var cellpos: Vector2i = floor_map.local_to_map(position)
		var celldata: TileData = floor_map.get_cell_tile_data(cellpos)
		if floor_map.enabled and celldata != null:
			if celldata.get_custom_data("Shrunklify"):
				ensmallify()
			elif celldata.get_custom_data("Unshrunkle"):
				enbiggify()
	# sprite changes  with movement
	if is_small == true:
		if Input.is_action_pressed("move_down"):
			$AnimatedSprite2D.set_frame(4)
		if Input.is_action_pressed("move_up"):
			$AnimatedSprite2D.set_frame(7)
		if Input.is_action_pressed("move_left"):
			$AnimatedSprite2D.set_frame(5)
		if Input.is_action_pressed("move_right"):
			$AnimatedSprite2D.set_frame(6)
	else:
		if Input.is_action_pressed("move_down"): # moving down while big
			$AnimatedSprite2D.set_frame(0)
			looking = 0
		if Input.is_action_pressed("move_up"):
			$AnimatedSprite2D.set_frame(3)
			looking = 3
		if Input.is_action_pressed("move_left"):
			$AnimatedSprite2D.set_frame(1)
			looking = 1
		if Input.is_action_pressed("move_right"):
			$AnimatedSprite2D.set_frame(2)
			looking = 2
		
		
	move_and_slide()

func ensmallify() -> void:
	is_small = true
	$AnimatedSprite2D.set_frame(looking + 4)
	$CollisionShape2D.shape.set_size(Vector2(6,6)) #change collsion size to match sprite
	shrunk.emit()

func enbiggify() -> void:
	is_small = false
	$AnimatedSprite2D.set_frame(looking)
	$CollisionShape2D.shape.set_size(Vector2(13,13)) #change collsion size to match sprite
	grew.emit()


func _on_trigger_collide_area_entered(area: Area2D) -> void:
	if area.name == "GrowTrigger":
		enbiggify()
