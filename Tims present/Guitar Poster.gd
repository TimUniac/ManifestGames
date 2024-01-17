extends Control



func _on_interaction_area_body_entered(body):
	if Input.is_action_just_pressed("Interact"):
		$Orbs.visible = true
	
