class_name Enemy

extends CharacterBody2D

@export var target_position: Vector2 = Vector2(0, 0)
@export var speed: int = 50
@export var health: int = 200
var total_health = health

@onready var NAgent = $NavigationAgent2D
@onready var ship_hit_sound = $ShipHitSound
@onready var ship_hull_damaged = $HullDownQuarter
@onready var effect_container = $EffectContainer

var previous_target = target_position
	
func _ready():
	# If you need to debug the agents
	#NAgent.debug_enabled = true
	pass
	
	
func _physics_process(delta: float) -> void:
	if previous_target != target_position:
		NAgent.target_position = target_position
		previous_target = target_position
		
	var next_position: Vector2 = NAgent.get_next_path_position()
	
	look_at(target_position)
	var normal_vector_toward_target = global_position.direction_to(next_position)
	velocity = normal_vector_toward_target * speed
	
	move_and_slide()
	# Agent Debuging
	#print("Distance to target: ", NAgent.distance_to_target())
	#print("Has Target Been Reached: ", NAgent.is_target_reached())
	#print("Is target Reachable?: ", NAgent.is_target_reachable())
	#print("Is Navigation Complete?: ", NAgent.is_navigation_finished())
	
func take_damage(amount: int) -> void:
	print(health)
	if health >= total_health * 0.75 && health - amount < total_health * 0.75:
		_hull_collapse(Debris.get_random_sm_debris())
	elif health >= total_health * 0.50 && health - amount < total_health * 0.50:
		_hull_collapse(Debris.get_random_med_debris())
	elif health >= total_health * 0.25 && health - amount < total_health * 0.25:
		_hull_collapse(Debris.get_random_lg_debris())
		
	ship_hit_sound.play()
	health -= amount
		
	
func _hull_collapse(debris_type: String) -> void:
	ship_hull_damaged.play()
	var debris_instance: Debris = Debris.create_debris(debris_type, Vector2(global_position.x + sin(rotation) * 50, global_position.y + -cos(rotation) * 50), rotation) 
	effect_container.add_child(debris_instance)
