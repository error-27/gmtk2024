extends CharacterBody2D

@export var big_speed: int = 20
@export var small_speed: int = 5

var is_small := false

@onready var collider := $CollisionShape2D
@onready var sprite := $Sprite2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var h_move := int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var v_move := int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = Vector2(h_move, v_move) * (small_speed if is_small else big_speed)
	
	move_and_slide()

func ensmallify() -> void:
	is_small = true
	collider.shape.size = Vector2i(4, 4)
	sprite.region_enabled = true

func enbiggify() -> void:
	is_small = false
	collider.shape.size = Vector2i(16, 16)
	sprite.region_enabled = false
