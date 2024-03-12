extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://Assets/Sound/SFX/Pickup.mp3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pickup():
	$'.'.play()
