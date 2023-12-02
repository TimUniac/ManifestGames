extends Control
var player = null

func _ready():
	$TextureButton.visible = false
	$Journal1Entry.visible = false

var is_opened = true

func close():
	$Journal1Entry.visible = false
	is_opened = false
func open():
	$Journal1Entry.visible = true
	is_opened = true

func _on_texture_button_pressed():
	if is_opened:
		close()
	else:
		open()
			

		


func _on_journal_2_body_entered(body):
	if body.has_method("player"):
		player = body
		await get_tree().create_timer(0.3).timeout
		$Journal2.visible = false
		$TextureButton.visible = true
