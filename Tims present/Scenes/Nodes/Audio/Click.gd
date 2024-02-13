extends TextureButton

var buttonSound: AudioStream = preload("res://Assets/SFX/Click.wav")

func _ready():
	# Connect the button's "pressed" signal to the "_on_button_pressed" function
	connect("pressed", _on_button_pressed, 1)

func _on_button_pressed():
	# Play the sound when the button is pressed
	AudioStreamPlayer.new().stream = buttonSound
	AudioStreamPlayer.new().play()
