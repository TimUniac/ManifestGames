extends Area2D

var player = null
	
@export var item: InvItem

	
func use():
	pass
	#input to use book here



func _on_body_entered(body):
	player = body
	playercollect()
	await get_tree().create_timer(0.1).timeout
	self.queue_free()
		
func playercollect():
	player.collect(item)
