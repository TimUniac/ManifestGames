extends Area2D

var player = null
@export var item: InvItem

func use():
	pass

func _on_body_entered(body):
	if body.has_method("player"):
		player = body
		await get_tree().create_timer(0.1).timeout
		self.queue_free()
		
func playercollect():
	player.collect(item)

		
