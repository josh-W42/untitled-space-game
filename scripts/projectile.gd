class_name Projectile

extends Area2D

@export var speed: int = 10
@export var damage: int = 10

@onready var animation_player = $AnimationPlayer

var fired_from: Node2D

func set_collision_masks(ids: Array[int]) -> void:
	for target_id in ids:
		set_collision_mask_value(target_id, true)

func _draw() -> void:
	animation_player.play("Fire_Projectile")

func _physics_process(_delta: float) -> void:
	global_position += Vector2(sin(rotation) * speed, cos(rotation) * -speed)

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy || body is Player:
		body.take_damage(damage)

	queue_free()
