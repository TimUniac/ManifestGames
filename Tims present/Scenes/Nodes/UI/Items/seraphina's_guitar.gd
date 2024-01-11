extends Area2D

@export var item: InvItem
@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
var player = null




func _on_body_entered(body):
	if body.has_method("player"):
		player = body
		playercollect()
		queue_free()

		
		

func playercollect():
	player.collect(item)
	print("player")
