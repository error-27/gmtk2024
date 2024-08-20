extends Node2D
class_name FinishPoint


func _on_finish_area_entered(_area: Area2D) -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/level_world.tscn")


func _on_visibility_changed() -> void:
	if visible:
		$finish/CollisionShape2D.disabled = false
	else:
		$finish/CollisionShape2D.disabled = true
