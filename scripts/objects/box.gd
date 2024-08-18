extends CharacterBody2D
class_name Box

var is_push = 0
var x_direction = 0 
var y_direction = 0
@export var x_mult = 1
@export var y_mult = 512

#var boxtimer = 0




func _physics_process(delta: float) -> void:
	#Basic idea
	#(is being pushed (0/1) * (time) * (direction to move) * (value)
 

	velocity.y = (is_push)*(delta*y_direction*y_mult)
	velocity.x = (is_push)*(delta*x_direction*x_mult)

	move_and_slide()


# debug printing

#	boxtimer += 1
#	if boxtimer >= (320):
#		print("-------------------------")
#		print("x: %s" % velocity.x)
#		print("y: %s" % velocity.y)
#		print("velocity: %s" % velocity)
#		print("push: %s" % is_push)
#		print("y direction: %s" % y_direction)
#		boxtimer -= 320










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
