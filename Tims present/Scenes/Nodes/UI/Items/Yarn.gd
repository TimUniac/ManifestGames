extends Area2D

@export var item: InvItem
var player = null
var inrange = false



func _process(delta):
	pass
	

func _on_body_entered(body):
	if body.has_method("player"):
		inrange = true
		player = body
		playercollect()
		queue_free()



func playercollect():
		player.collect(item)
		print("player")
