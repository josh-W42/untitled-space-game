class_name Helpers

extends Node

static func Get_files_from_dir(path: String) -> Array[String]:
	var dir = DirAccess.open(path)
	if dir == null:
		print("An error occurred when trying to access the path.")
		return []
		
	var file_names: Array[String] = []
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("Found directory: " + file_name)
		elif file_name.ends_with("png"):
			file_names.append(file_name)
		file_name = dir.get_next()
		
	return file_names
