extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = 0.1
	scale.y = 0.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if scale.x <= 1:
		scale.x += 0.01
		scale.y += 0.01
