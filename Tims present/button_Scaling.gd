extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = 0.1
	scale.y = 0.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scale.x <= 1:
		scale.x += 0.01
		scale.y += 0.01
func wait(seconds: float) -> void:
	await get_tree().create_timer(2.0).timeout
	visible = true

func _on_letter_c_button_up():
	wait(2.0)
