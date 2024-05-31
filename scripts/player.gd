class_name Player

extends RigidBody2D

@export var force = 500
@export var torque_force = 10000

func _physics_process(delta: float) -> void:
	_handle_player_input()


func _handle_player_input() -> void:
	if (Input.is_action_pressed("player_move_up")):
		apply_force(Vector2(sin(rotation) * force, cos(rotation) * -force))
	if (Input.is_action_pressed("player_move_left")):
		apply_torque(-torque_force)
	if (Input.is_action_pressed("player_move_right")):
		apply_torque(torque_force)
	

