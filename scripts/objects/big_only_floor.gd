extends StaticBody2D

func disable() -> void:
	$CollisionShape2D.disabled = true
	$TileMapLayer.modulate = Color(0, 0.67, 0.67)
