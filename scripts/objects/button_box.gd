extends CharacterBody2D
class_name Button_Box

signal button_press(coord: Vector2i)

var is_push = 0
var x_direction = 0 
var y_direction = 0
var x_mult = -512
var y_mult = 512
var x_vol = 0
var y_vol = 0
#var boxtimer = 0
#@onready var tilemaplayer : TileMapLayer = $TileMapLayer



func _physics_process(delta: float) -> void:
	#Basic idea
	#(is being pushed (0/1) * (time) * (direction to move) * (value)
 

	#velocity.y = (is_push)*(delta*y_direction*y_mult)
	#velocity.x = (is_push)*(delta*x_direction*x_mult)
	x_vol = (is_push)*(delta*x_direction*x_mult)
	y_vol = (is_push)*(delta*y_direction*y_mult)
	if y_vol != 0: #if y velocity is anything but zero, x velocity is zero (fixes hooking, kinda)
		x_vol = 0


	velocity = Vector2((x_vol), (y_vol))

	move_and_slide()
	
	var box_floor: TileMapLayer = get_node("../../LevelOverlord").floor_map
	if box_floor.get_cell_atlas_coords(box_floor.local_to_map(global_position)) == Vector2i(46, 2):
		button_press.emit(box_floor.local_to_map(global_position))
		

func _on_button_press_area_entered(area: Area2D) -> void:
	if area.name == "Button_Area":
		#button_press.emit()
		#print("button press")
		#tilemaplayer.set_cell(Vector2i(3,3), 0, Vector2i(27,15), 0)
		pass # Replace with function body.



func _on_right_area_body_entered(_body: Node2D) -> void:
	x_direction = 1
	is_push = 1

func _on_right_area_body_exited(_body: Node2D) -> void:
	x_direction = 0
	is_push = 0
	
func _on_left_area_body_entered(_body: Node2D) -> void:
	x_direction = -1
	is_push = 1
	
func _on_left_area_body_exited(_body: Node2D) -> void:
	x_direction = 0
	is_push = 0
	
func _on_top_area_body_entered(_body: Node2D) -> void:
	y_direction = 1
	is_push = 1



func _on_top_area_body_exited(_body: Node2D) -> void:
	y_direction = 0
	is_push = 0
	
func _on_bottom_area_body_entered(_body: Node2D) -> void:
	y_direction = -1
	is_push = 1
	
func _on_bottom_area_body_exited(_body: Node2D) -> void:
	y_direction = 0
	is_push = 0


func _on_visibility_changed() -> void:
	$CollisionShape2D.disabled = not visible
	$right_area/right_box_shape.disabled = not visible
	$left_area/left_box_shape.disabled = not visible
	$top_area/top_box_shape.disabled = not visible
	$"bottom area/bottom_box_shape".disabled = not visible
	$button_press/CollisionShape2D.disabled = not visible
