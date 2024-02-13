extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	var audioStream: AudioStream = preload("res://Assets/SFX/Click.wav") # Replace with function body.
	self.set_stream(audioStream)
	self.set_volume_db(-3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_exit_pressed():
	self.play() # Replace with function body.
