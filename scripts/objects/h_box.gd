extends CharacterBody2D
class_name H_Box

var is_push = 0
var x_direction = 0 
var x_mult = -512
var x_vol = 0
var bot_push = 0

func _physics_process(delta: float) -> void:
	#Basic idea
	#(is being pushed (0/1) * (time) * (direction to move) * (value)

	velocity.x = (is_push)*(delta*x_direction*x_mult)
	velocity.y = 0
	#velocity = Vector2((x_vol), 0)
	if bot_push == 0:
		move_and_slide()

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

func _on_bottom_area_body_entered(_body: Node2D) -> void:
	bot_push = 1
	
func _on_bottom_area_body_exited(_body: Node2D) -> void:
	bot_push = 0

func _on_top_area_body_entered(_body: Node2D) -> void:
	bot_push = 1
	
func _on_top_area_body_exited(_body: Node2D) -> void:
	bot_push = 0
