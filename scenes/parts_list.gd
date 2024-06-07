extends Control

@onready var grid = $ScrollContainer/PartGrid

var small_parts_path = Constants.FILE_PATH_ASSETS + "parts/"
var large_parts_path = Constants.FILE_PATH_ASSETS + "parts_2x/"

func _ready() -> void:
	for ship_part in Helpers.Get_files_from_dir(small_parts_path):
		var texture = load(small_parts_path + ship_part)
		var texture_rect = TextureRect.new()
		texture_rect.texture = texture
		texture_rect.stretch_mode = TextureRect.STRETCH_KEEP
		texture_rect.expand_mode = TextureRect.EXPAND_KEEP_SIZE
		
		grid.add_child(texture_rect)
