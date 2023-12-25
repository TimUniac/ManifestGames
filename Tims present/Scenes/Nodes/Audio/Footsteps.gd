extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audioStream: AudioStream = preload("res://Assets/Sound/SFX/SquishyFootfalls.3.wav") # Replace with function body.
	self.set_stream(audioStream)
	self.set_volume_db(-10)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("right"):
		self.get_playback_position()
		if self.get_playback_position() == 0.0:
			self.pitch_scale = randf_range(0.8, 1.3)
			self.play()
		else:
			pass

	if Input.is_action_pressed("left"):
		self.get_playback_position()
		if self.get_playback_position() == 0.0:
			self.pitch_scale = randf_range(0.8, 1.3)
			self.play()
		else:
			pass
			
	if Input.is_action_pressed("up"):
		self.get_playback_position()
		if self.get_playback_position() == 0.0:
			self.pitch_scale = randf_range(0.8, 1.3)
			self.play()
		else:
			pass
	
	if Input.is_action_pressed("down"):
		self.get_playback_position()
		if self.get_playback_position() == 0.0:
			self.pitch_scale = randf_range(0.8, 1.3)
			self.play()
		else:
			pass
