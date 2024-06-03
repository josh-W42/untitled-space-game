class_name Debris

extends RigidBody2D

@export var sprite_texture: Texture2D

@onready var sprite = $Sprite2D

var speed = 1
	
func _ready() -> void:
	sprite.texture = sprite_texture


func _physics_process(delta: float) -> void:
	global_position += Vector2(sin(rotation) * speed, cos(rotation) * -speed)

func set_texture(texture: Texture2D) -> void:
	sprite_texture = texture
	

static func get_random_sm_debris() -> String:
	return [Constants.DEBRIS_SM_1, Constants.DEBRIS_SM_2, Constants.DEBRIS_SM_3].pick_random()
	
static func get_random_med_debris() -> String:
	return [Constants.DEBRIS_MED_1, Constants.DEBRIS_MED_2, Constants.DEBRIS_MED_3].pick_random()

static func get_random_lg_debris() -> String:
	return [Constants.DEBRIS_LG_1, Constants.DEBRIS_LG_2, Constants.DEBRIS_LG_3].pick_random()
