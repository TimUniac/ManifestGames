extends Control
var player = null


var is_opened = false
var inRange = false

func _ready():
	$TextureButton.visible = false
	$Journal1Entry.visible = false



func close():
	$Journal1Entry.visible = false
	is_opened = false
func open():
	$Journal1Entry.visible = true
	is_opened = true

func _process(delta):
	
	if Input.is_action_just_pressed("Journal") and inRange:
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
		inRange = true
