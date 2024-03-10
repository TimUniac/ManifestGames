extends Area2D

@onready var interaction_label = $Panel/interaction_label

signal bodyEntered
signal bodyExited

func _on_body_entered(body):
	interaction_label.visible = true
	emit_signal("bodyEntered") # Emit signal on body entered
	print("body near poster")
	
func _on_body_exited(body):
	interaction_label.visible = false
	emit_signal("bodyExited") # Emit signal on body exited
