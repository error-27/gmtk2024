extends CharacterBody2D
class_name Box



var is_pushed = 0
var x_direction = 0
var y_direction = 0 



func _box_physics(delta: float) -> void:
	# what I'm trying to do: is_pushed == 1 when it is pushed
	# so if it's not pushed, movement is zero
	# if it is, take the x & y movements
	# directions are (up/right) 1 & -1 (down/left)
	
	# can be adapted to make blocks that only go in one or a few directions
	
	velocity.x += is_pushed*x_direction
	velocity.y += is_pushed*y_direction
	move_and_slide()


func _on_right_area_body_entered(body: Node2D) -> void:
	is_pushed = 1
	print("pushed right side")


func _on_right_area_body_exited(body: Node2D) -> void:
	is_pushed = 0


func _on_left_area_body_entered(body: Node2D) -> void:
	is_pushed = 1
	print("pushed left side")


func _on_left_area_body_exited(body: Node2D) -> void:
	is_pushed = 0
