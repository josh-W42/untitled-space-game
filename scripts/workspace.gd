extends Control


var rect: Rect2

func _ready() -> void:
	rect = get_rect()

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if (!_is_within_bounds(at_position)):
		return false
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var texture_rect = TextureRect.new()
	texture_rect.texture = data
	texture_rect.position = at_position
	
	add_child(texture_rect)

func _is_within_bounds(pos: Vector2) -> bool:
	var margin = 15
	if (pos.x < margin):
		return false
	
	if (pos.x > rect.size.x - margin):
		return false
		
	if (pos.y < margin):
		return false
	
	if (pos.y > rect.size.y - margin):
		return false
	
	return true
