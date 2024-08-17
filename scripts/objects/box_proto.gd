extends CharacterBody2D
class_name Box

var is_push = 0
var x_direction = 0 
var y_direction = 0


func _ready() -> void:
	velocity.x = 0
	velocity.y = 0

func _physics_process(delta: float) -> void:
	#velocity.x = 0
	#velocity.y = 0
	velocity.x = is_push*delta*x_direction*16
	velocity.y = is_push*delta*y_direction*16 

	move_and_slide()
	#print("x: %s" % velocity.x)
	#print("y: %s" % velocity.y)







func _on_right_area_body_entered(body: Node2D) -> void:
	is_push = 1
	x_direction = 1


func _on_right_area_body_exited(body: Node2D) -> void:
	is_push = 0
	x_direction = 0


func _on_left_area_body_entered(body: Node2D) -> void:
	is_push = 1
	x_direction = -1


func _on_left_area_body_exited(body: Node2D) -> void:
	is_push = 0
	x_direction = 0


func _on_top_area_body_entered(body: Node2D) -> void:
	is_push = 1
	y_direction = -1


func _on_top_area_body_exited(body: Node2D) -> void:
	is_push = 0
	y_direction = 0
