extends Area2D


@export var action_name: String = "Look"
@onready var look_label = $Clue
func _ready():
	look_label.visible = false
	

func _on_body_entered(body):
	look_label.visible = true

func _on_body_exited(body):
	look_label.visible = false
