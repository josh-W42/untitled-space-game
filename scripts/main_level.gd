extends Node2D

@onready var player: Player = $Player

func _ready() -> void:
	for enemy in get_tree().get_nodes_in_group("Tracking_Enemies"):
		enemy.target_position = player.global_position


func _process(delta: float) -> void:
	#print(player.global_position.distance_squared_to(enemy.target_position))
	for enemy in get_tree().get_nodes_in_group("Tracking_Enemies"):
		if player.global_position.distance_squared_to(enemy.target_position) > 1000:
			enemy.target_position = player.global_position
		
