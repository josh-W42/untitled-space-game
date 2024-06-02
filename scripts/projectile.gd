extends Area2D

@export var speed = 10

func _physics_process(delta: float) -> void:
	global_position += Vector2(sin(rotation) * speed, cos(rotation) * -speed)
