extends Area2D

signal book_interacted(bookDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")

@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
@onready var talking = false

var player = null
var inrange = false
var collect = false
var is_opened = false

var gameBook = null
@onready var bookDialogue: String = "The cover of this book is so damaged I can't read the title."
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

func _ready():
	interaction_label.visible = false
	


func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(bookDialogue)
		
func _on_body_exited(body):
	interaction_label.visible = false
	inrange = false

func _process(delta):
	if inrange and Input.is_action_just_pressed("Interact"):
		if is_opened:
			close()
		else:
			open()

func open():
	
	if gameBook == null:
		var book_game_scene = preload("res://Scenes/Nodes/UI/book_game.tscn").instantiate()
		
		gameBook = book_game_scene
		add_child(gameBook)
		print_tree()
	doctor.talking = true
	is_opened = true	
func close():
	
	if gameBook != null:
		remove_child(gameBook)
		gameBook.queue_free()
		gameBook = null
	doctor.talking = false
	is_opened = false
	
	
		

signal item_collected()

func playercollect():
	emit_signal("item_collected")
	visible = false
	print ("player collect novel")



func _on_texture_button_pressed():
	close()
