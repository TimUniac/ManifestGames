extends Control
var player = null

signal journal_interacted(journalDialogue)
@onready var journalDialogue: String = "This must be her journal, it'll have clues.([J] to read)"
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"
@onready var doctor = get_parent().get_node("Male Doctor Character")

var is_opened = false
var inRange = false

func _ready():
	$TextureButton.visible = false
	$CanvasLayer/NewJournal.visible = false
	$Journal2/CollisionShape2D2/hint.visible = false



func close():
	$CanvasLayer/NewJournal.visible = false
	doctor.talking = false
	is_opened = false
	
func open():
	$CanvasLayer/NewJournal.visible = true
	doctor.talking = true
	is_opened = true


func _process(_delta):
	
	if Input.is_action_just_pressed("Journal") and inRange:
		if is_opened:
			close()
		else:
			open()
			
		


func _on_journal_2_body_entered(body):
	if body.has_method("player"):
		player = body
		doctor.speak(journalDialogue)
		await get_tree().create_timer(0.3).timeout
		$Journal2.queue_free()
		$TextureButton.visible = true
		inRange = true
	
