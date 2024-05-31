class_name Enemy

extends CharacterBody2D

@export var target_position: Vector2 = Vector2(0, 0)
@export var speed = 50

@onready var NAgent = $NavigationAgent2D

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
	
