extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://Assets/SFX/Click.wav")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_pressed():
	is_playing
