extends CharacterBody2D
class_name V_Box

var is_push = 0
var y_direction = 0 
var y_mult = 512
var y_vol = 0
var sid_push = 0

func _physics_process(delta: float) -> void:
	#Basic idea
	#(is being pushed (0/1) * (time) * (direction to move) * (value)

	velocity.y = (is_push)*(delta*y_direction*y_mult)
	velocity.x = 0
	#velocity = Vector2((x_vol), 0)
	if sid_push == 0:
		move_and_slide()

func _on_right_area_body_entered(_body: Node2D) -> void:
	sid_push = 1


func _on_right_area_body_exited(_body: Node2D) -> void:
	sid_push = 0

	
func _on_left_area_body_entered(_body: Node2D) -> void:
	sid_push = 1

	
func _on_left_area_body_exited(_body: Node2D) -> void:
	sid_push = 0

func _on_bottom_area_body_entered(_body: Node2D) -> void:
	y_direction = -1
	is_push = 1

func _on_bottom_area_body_exited(_body: Node2D) -> void:
	y_direction = 0
	is_push = 0

func _on_top_area_body_entered(_body: Node2D) -> void:
	y_direction = 1
	is_push = 1
	
func _on_top_area_body_exited(_body: Node2D) -> void:
	y_direction = 0
	is_push = 0
