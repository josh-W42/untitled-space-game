extends Node2D

@export var enemy_count = 5

@onready var world = $World

func _ready() -> void:
	world.spawn_player()
	
	for i in range(enemy_count):
		world.spawn_enemy()
