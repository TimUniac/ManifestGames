extends Area2D

@export var item: InvItem
var player = null
var collect = false 
var inReach = false

func _process(delta):
	pass
	

func _on_body_entered(body):
	if body.has_method("player"):
		player = body
		inReach = true

func _input(InputEvent):
	if Input.is_action_just_pressed("Pickup") and inReach:
		collect = true
		print ("input")
		
	if inReach and collect:
		playercollect()
		queue_free()
		print("body")

func playercollect():
	if player:
		player.collect(item)
		print("player")
