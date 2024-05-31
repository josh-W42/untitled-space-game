extends Node2D

@export var enemy_retargeting_delta: int = 1000

@onready var player: Player = $Player

func _ready() -> void:
	for enemy in get_tree().get_nodes_in_group("Tracking_Enemies"):
		enemy.target_position = player.global_position


func _process(delta: float) -> void:
	for enemy in get_tree().get_nodes_in_group("Tracking_Enemies"):
		if player.global_position.distance_squared_to(enemy.target_position) > enemy_retargeting_delta:
			enemy.target_position = player.global_position
		
