extends Area2D


signal picturegame_interacted(picturegameDialogue)
@export var action_name: String = "interact"

@onready var interactionlabel = $Interactionarea
@onready var doctor = get_parent().get_node("Male Doctor Character")



@onready var sprite = $Sprite2D
@onready var talking = false
@onready var objlist = $"../Objectives"

var player = null
var inrange = false
var collect = false
var is_opened = false
var opened = false


var picturegame = null
@onready var picturegameDialogue: String = "Whats ripped up at the bottom of the locker, we must solve the puzzle!"
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

var lockeropened = false

func locker_open():
	lockeropened = true
	
	
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
			var picturegame_game_scene = preload("res://Scenes/Nodes/puzzle_game.tscn").instantiate()
		
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
	$Interactionarea.visible = false
	$Interactionarea/CollisionShape2D.queue_free()
	
	
		

signal item_collected()

func playersolved_puzzle():
	emit_signal("item_collected")
	visible = false
	$Interactionarea.queue_free()
	objlist.foundpicture()
	print ("player solved puzzle")





func _on_interactionarea_body_entered(body):
	if lockeropened == true:
		if body.has_method("player"):
			interactionlabel.visible = true
			inrange = true
			player = body
			print("hi there")
			doctor.speak(picturegameDialogue)


func _on_interactionarea_body_exited(body):
		interactionlabel.visible = false
		inrange = false
