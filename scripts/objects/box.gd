extends CharacterBody2D
class_name Box

var is_push = 0
var x_direction = 0 
var y_direction = 0
var x_mult = -512
var y_mult = 512
var x_vol = 0
var y_vol = 0
#var boxtimer = 0




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


# debug printing

#	boxtimer += 1
#	if boxtimer >= (120):
#		print("-------------------------")
#		print("y direct: %s" % y_direction)
#		print("x direct: %s" % x_direction)
#		print("result: %s" % (x_direction - y_direction))
#		print("x: %s" % velocity.x)
#		print("y: %s" % velocity.y)
#		print("velocity: %s" % velocity)
#		print("push: %s" % is_push)
#		print("y direction: %s" % y_direction)
#		boxtimer -= 120

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
