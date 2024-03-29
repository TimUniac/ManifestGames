extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionIn.play(2.8)
	$"transition player".play("Fade_In")



