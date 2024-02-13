extends TextureButton

var buttonSound: AudioStream = preload("res://Assets/SFX/Click.wav")



func _on_button_pressed():
	# Play the sound when the button is pressed
	AudioStreamPlayer.new().stream = buttonSound
	AudioStreamPlayer.new().play()
