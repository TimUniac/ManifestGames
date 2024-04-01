extends Area2D


signal picturegame_interacted(picturegameDialogue)
@export var action_name: String = "interact"

@onready var interactionlabel = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")




@onready var talking = false
@onready var objlist = $"../CanvasLayer/Objectives"

var player = null
var inrange = false
var collect = false
var is_opened = false
var opened = false


var picturegame = null
@onready var heartNecklaceGameDialogue: String = "Wow, she through this necklace down hard for it to break like this."
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"


	
	
func _ready():
	interactionlabel.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if inrange and Input.is_action_just_pressed("Interact"):
			if is_opened:
				close()
			else:
				open()
	

	
	
func open():
		if picturegame == null:
			var picturegame_game_scene = preload("res://HeartNacklacePuzzle.tscn").instantiate()
		
			picturegame = picturegame_game_scene
			add_child(picturegame)
			print_tree()
		doctor.talking = true
		is_opened = true	
func close():
	if picturegame != null:
		remove_child(picturegame)
		picturegame.queue_free()
		picturegame = null
	doctor.talking = false
	is_opened = false
	
func solvedpuzzle():
	doctor.talking = false
	interactionlabel.visible = false
	$CollisionShape2D.queue_free()
	objlist.foundbook()
	
		

signal item_collected()

func playersolved_puzzle():
	emit_signal("item_collected")
	visible = false
	interactionlabel.queue_free()
	print ("player solved puzzle")


func _on_body_exited(body):
		inrange = false
		


func _on_body_entered(body):
	if body.has_method("player"):
			interactionlabel.visible = true
			inrange = true
			player = body
			print("hi there")
			doctor.speak(heartNecklaceGameDialogue)
