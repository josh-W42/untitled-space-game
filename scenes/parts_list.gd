extends Control

@onready var grid = $ScrollContainer/PartGrid

var small_parts_path = Constants.FILE_PATH_ASSETS + "parts/"
var large_parts_path = Constants.FILE_PATH_ASSETS + "parts_2x/"

func _ready() -> void:
	for ship_part in dir_contents():
		var texture = load(small_parts_path + ship_part)
		var texture_rect = TextureRect.new()
		texture_rect.texture = texture
		
		grid.add_child(texture_rect)
		
	
func dir_contents() -> Array[String]:
	print(small_parts_path)
	var dir = DirAccess.open(small_parts_path)
	if dir == null:
		print("An error occurred when trying to access the path.")
		return []
		
	var paths: Array[String] = []
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("Found directory: " + file_name)
		elif file_name.ends_with("png"):
			paths.append(file_name)
		file_name = dir.get_next()
		
	return paths
