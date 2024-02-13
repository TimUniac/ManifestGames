extends Area2D

var player = null




@export var item: InvItem




func _on_body_entered(body):
	if body.has_method("player"):
		player = body
		playersee()
		await get_tree().create_timer(0.1).timeout
		self.queue_free()
		
func playersee():
	player.collect(item)
