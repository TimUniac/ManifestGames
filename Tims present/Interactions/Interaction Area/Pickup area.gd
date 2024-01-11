extends Area2D

class_name InteractionArea

@export var action_name: String = "interact"
@onready var pickup_label = $pickup_label

func _ready():
	pickup_label.visible = false


func _on_body_entered(body):
	pickup_label.visible = true

func _on_body_exited(body):
	pickup_label.visible = false

