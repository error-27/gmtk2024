extends CharacterBody2D
class_name GridBox

var is_push = 0
var x_direction = 0 
var y_direction = 0




func _on_right_area_body_entered(body: Node2D) -> void:
	is_push = 1
	position.x -= 64


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


func _on_bottom_area_body_entered(body: Node2D) -> void:
	is_push = 1
	y_direction = 1


func _on_bottom_area_body_exited(body: Node2D) -> void:
	is_push = 0
	y_direction = 0
