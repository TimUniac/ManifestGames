extends Area2D


@export var action_name: String = "Look"
@onready var interaction_label = $Panel
func _ready():
	interaction_label.visible = false
	

func _on_body_entered(body):
	interaction_label.visible = true

func _on_body_exited(body):
	interaction_label.visible = false
