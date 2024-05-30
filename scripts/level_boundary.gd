extends Area2D


func _on_body_exited(body: Node2D) -> void:
	
	if body is RigidBody2D:
		if body.global_position.x < 0:
			body.global_position.x = get_window().size.x
		elif body.global_position.x > get_window().size.x:
			body.global_position.x = 0
		elif body.global_position.y < 0:
			body.global_position.y = get_window().size.y
		elif body.global_position.y > get_window().size.y:
			body.global_position.y = 0
		
