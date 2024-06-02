class_name Player

extends RigidBody2D

@export var force = 500
@export var torque = 10000

@onready var weapon_container = $WeaponContainer
@onready var projectile_fire_sound = $ProjectileFireAudio

var projectile_scene = preload("res://scenes/projectile.tscn")

func _physics_process(delta: float) -> void:
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
	

func _fire_projectile():
	var instance: Area2D = projectile_scene.instantiate()
	
	projectile_fire_sound.play()
	weapon_container.add_child(instance)
	instance.global_position = Vector2(global_position.x + sin(rotation) * 50, global_position.y + -cos(rotation) * 50)
	instance.rotation = rotation
	
