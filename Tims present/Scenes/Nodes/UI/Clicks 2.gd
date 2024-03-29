extends AudioStreamPlayer2D

func play_random_pitch():
	var random_pitch_scale = randf_range(0.5, 2.0)
	self.pitch_scale = random_pitch_scale
	self.play()


