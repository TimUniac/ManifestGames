extends Area2D

signal locker_interacted(lockerDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Interactionarea
@onready var doctor = get_parent().get_node("Male Doctor Character")



@onready var sprite = $Sprite2D
@onready var talking = false
@onready var openedlocker = $OpenedLocker	
@onready var closedlocker = $ClosedLocker

var player = null
var inrange = false
var collect = false
var is_opened = false
var opened = false

var gamelock = null
@onready var lockerDialogue: String = "I wonder what Seraphina's locker combination is?"
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

func _ready():
	openedlocker.visible = false
	interaction_label.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if inrange and Input.is_action_just_pressed("Interact"):
			if is_opened:
				close()
			else:
				open()
	
	

func open():
	
	if gamelock == null:
		var lock_game_scene = preload("res://combo_lock_game.tscn").instantiate()
		
		gamelock = lock_game_scene
		add_child(gamelock)
		print_tree()
	doctor.talking = true
	is_opened = true	
func close():
	
	if gamelock != null:
		remove_child(gamelock)
		gamelock.queue_free()
		gamelock = null
	doctor.talking = false
	is_opened = false
	
func open_locker():
	openedlocker.visible = true
	opened = true
	closedlocker.visible = false
	doctor.talking = false
	$Interactionarea.visible = false
	$Interactionarea/CollisionShape2D.queue_free()
	
		

signal item_collected()

func playerunlockedlocker():
	emit_signal("item_collected")
	visible = false
	$Interactionarea.queue_free()
	
	print ("player opened locker")


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(lockerDialogue)


func _on_area_2d_body_exited(body):
	interaction_label.visible = false
	inrange = false
