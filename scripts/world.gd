extends Node2D

@export var enemy_retargeting_delta: int = 1000

const enemy_scene = preload("res://scenes/enemy_red_sm.tscn")
const player_scene = preload("res://scenes/player.tscn")
const debris_scene = preload("res://scenes/debris.tscn")

var player: Player

@onready var player_spawn = $PlayerSpawn

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if player == null:
		return
		
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		if player.global_position.distance_squared_to(enemy.target_position) > enemy_retargeting_delta:
			enemy.target_position = player.global_position
		

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	var enemy_position = Vector2(randf_range(10, get_window().size.x), randf_range(10, get_window().size.y))
	enemy_instance.global_position = enemy_position
	enemy_instance.connect("spawn_debris", _on_enemy_spawn_debris)
	add_child(enemy_instance)

func spawn_player():
	var player_instance = player_scene.instantiate()
	player_instance.global_position = player_spawn.global_position
	add_child(player_instance)
	player = player_instance
	
func spawn_debris(texture_path: String, postion: Vector2, velocity: Vector2):
	var texture: Texture2D = load(texture_path)
	var debris_instance: Debris = debris_scene.instantiate()
	debris_instance.set_texture(texture)
	debris_instance.global_position = postion
	debris_instance.linear_velocity = velocity
	add_child(debris_instance)


func _on_enemy_spawn_debris(texture_path: String, postion: Vector2, velocity: Vector2) -> void:
	spawn_debris(texture_path, postion, velocity)
