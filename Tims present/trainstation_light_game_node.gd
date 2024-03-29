extends Area2D

signal locker_interacted(lockerDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel

@onready var doctor = get_parent().get_node("Male Doctor Character")




@onready var objlist = $"../Objectives"
@onready var sprite = $Sprite2D
@onready var talking = false


var player = null
var inrange = false
var collect = false
var is_opened = false


var gametrainlight = null
@onready var trainlightDialogue: String = "The trainstation is dark, we should turn on the lights!"
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"


func _ready():
	interaction_label.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if inrange and Input.is_action_just_pressed("Interact"):
			if is_opened:
				close()
			else:
				open()
	
	

func open():
	
	if gametrainlight == null:
		var trainlight_game_scene = preload("res://Scenes/game_trainstation_light.tscn").instantiate()
		
		gametrainlight = trainlight_game_scene
		add_child(gametrainlight)
		print_tree()
	doctor.talking = true
	is_opened = true	
func close():
	
	if gametrainlight != null:
		remove_child(gametrainlight)
		gametrainlight.queue_free()
		gametrainlight = null
	doctor.talking = false
	is_opened = false
	
func lightsturnedon():
	doctor.talking = false
	interaction_label.visible = false
	$ColorRect.visible = false
	$CollisionShape2D.queue_free()
	var parent = get_parent()
	parent.lightson()


		

signal item_collected()


func playercollect():
	emit_signal("item_collected")
	print("ahhhhhhhhh")

	
	



func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(trainlightDialogue)


func _on_body_exited(body):
	interaction_label.visible = false
	inrange = false


