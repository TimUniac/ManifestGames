extends Area2D

signal tutorial_interacted(tutorialDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")


@onready var sprite = $Sprite2D
var player = null
var inrange = false
var collect = false
var is_opened = false

@onready var tutorialDialogue: String = "These files are new to my memories, I'll need to unlock them."


@onready var counter = $"../windowCounter"

var gameFiles = null
var counted = false
func _ready():
	interaction_label.visible = false


func _on_code_correct():
	playercollect()

func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(tutorialDialogue)
		
func _on_body_exited(_body):
	interaction_label.visible = false
	inrange = false

func _process(_delta):
	if inrange and Input.is_action_just_pressed("Interact"):
		if is_opened:
			close()
			counted = false
		else:
			open()
			counter = true

func open():
	if gameFiles == null:
		var tutorial_game_scene = preload("res://Scenes/Nodes/UI/tutorial_game.tscn").instantiate()
		
		gameFiles = tutorial_game_scene
		add_child(gameFiles)
		print_tree()
	doctor.talking = true
	is_opened = true 
	if counted == true:
		counter.openWindow()
	
		

func close():
	if gameFiles != null:
		remove_child(gameFiles)
		gameFiles.queue_free()
		gameFiles = null
	doctor.talking = false
	is_opened = false
	if counted == true:
		counter.closeWindow()
		counted = false
		

signal item_collected
signal playGame

func playercollect():
	emit_signal("item_collected")
	visible = false


