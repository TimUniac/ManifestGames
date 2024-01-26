extends Control

var is_opened = false

func _ready():
	$ChordChart.visible = false
	
func _on_interaction_area_body_entered(body):
	if Input.is_action_just_pressed("Interact"):
		if is_opened:
			$ChordChart.visible = false
			print ("Look")
		else:
			$ChordChart.visible = true
		
	
