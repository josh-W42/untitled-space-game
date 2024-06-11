extends TextureButton

func _get_drag_data(at_position: Vector2) -> Variant:
	var texture_rect: TextureRect = TextureRect.new()
	texture_rect.texture = texture_normal
	
	var preview = Control.new()
	preview.add_child(texture_rect)
	
	set_drag_preview(preview)
	
	return texture_normal
