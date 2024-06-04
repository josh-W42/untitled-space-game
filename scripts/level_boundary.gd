extends Area2D


func _on_body_exited(body: Node2D) -> void:
	
	if body is RigidBody2D:
		if body.global_position.x < 0:
			body.global_position.x = get_window().size.x
		if body.global_position.x > get_window().size.x:
			body.global_position.x = 0
		if body.global_position.y < 0:
			body.global_position.y = get_window().size.y
		if body.global_position.y > get_window().size.y:
			body.global_position.y = 0


func _on_area_exited(area: Area2D) -> void:
	area.queue_free()
