extends Control

@onready var grid = $ScrollContainer/PartGrid

var part_button_scene = preload("res://scenes/part_button.tscn")


var small_parts_path = Constants.FILE_PATH_ASSETS + "parts/"
var large_parts_path = Constants.FILE_PATH_ASSETS + "parts_2x/"

func _ready() -> void:
	for ship_part in Helpers.Get_PNGs_from_dir(small_parts_path):
		var texture = load(small_parts_path + ship_part)
		
		var texture_button: TextureButton = part_button_scene.instantiate()
		texture_button.texture_normal = texture
		texture_button.stretch_mode = TextureButton.STRETCH_KEEP_CENTERED
		texture_button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		
		grid.add_child(texture_button)
		
	
