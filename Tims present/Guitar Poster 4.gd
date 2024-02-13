extends Control

var is_opened = false

func _ready():
	$Orbs.visible = false
	
func _on_interaction_area_body_entered(body):
	if Input.is_action_just_pressed("Interact"):
		if is_opened:
			$Orbs.visible = false
		else:
			$Orbs.visible = true
		
	
