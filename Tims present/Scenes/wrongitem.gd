extends Area2D

@export var item: InvItem
var player = null

@export var inReach = false

func _process(delta):
	pass
	

func _on_body_entered(body):
	if body.has_method("player"):
		player = body
		inReach = true

func _input(InputEvent):
	if Input.is_action_just_pressed("Pickup") and inReach:
		for child in get_children():
			if child.has_method("play_random_sound"):
				child.play_random_sound()

