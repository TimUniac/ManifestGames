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


var gametrainNackPuzz = null
@onready var trainNackPuzzDialogue: String = "This must be the other half of the necklace, lets see if the piece fits"
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
	
	if gametrainNackPuzz == null:
		var trainNackPuzz_game_scene = preload("res://HeartNacklacePuzzle.tscn").instantiate()
		
		gametrainNackPuzz = trainNackPuzz_game_scene
		add_child(gametrainNackPuzz)
		print_tree()
	doctor.talking = true
	is_opened = true	
func close():
	
	if gametrainNackPuzz != null:
		remove_child(gametrainNackPuzz)
		gametrainNackPuzz.queue_free()
		gametrainNackPuzz = null
	doctor.talking = false
	is_opened = false
	
func mapcompleted():
	doctor.talking = false
	interaction_label.visible = false
	$ColorRect.visible = false
	$CollisionShape2D.queue_free()
	var parent = get_parent()
	parent.puzzlecomplete()



signal item_collected()

func playercollect():
	emit_signal("item_collected")
	print("ahhhhhhh")

func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(trainNackPuzzDialogue)


func _on_body_exited(body):
	interaction_label.visible = false
	inrange = false


