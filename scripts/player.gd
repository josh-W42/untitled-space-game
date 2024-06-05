class_name Player

extends RigidBody2D

@export var force = 500
@export var torque = 10000
@export var health = 100

@onready var projectile_fire_sound = $ProjectileFireAudio

var projectile_scene = preload("res://scenes/projectile.tscn")

func _physics_process(_delta: float) -> void:
	_handle_player_input()


func _handle_player_input() -> void:
	if (Input.is_action_pressed("player_move_up")):
		apply_force(Vector2(sin(rotation) * force, cos(rotation) * -force))
	if (Input.is_action_pressed("player_move_left")):
		apply_torque(-torque)
	if (Input.is_action_pressed("player_move_right")):
		apply_torque(torque)
	if (Input.is_action_just_pressed("fire")):
		_fire_projectile()
	

func _fire_projectile() -> void:
	var instance: Projectile = projectile_scene.instantiate()
	
	
	projectile_fire_sound.play()
	instance.global_position = Vector2(global_position.x + sin(rotation) * 50, global_position.y + -cos(rotation) * 50)
	instance.rotation = rotation
	instance.set_collision_masks([Constants.COLLISION_ID_ENEMY])
	
	get_parent().add_child(instance)
	
func take_damage(amount: int) -> void:
	#ship_hit_sound.play()
	print(health)
	health -= amount
	
	if health <= 0:
		queue_free()
	
