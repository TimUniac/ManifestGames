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


var gametrainMap = null
@onready var trainMapDialogue: String = "Solve the route Seraphina was taking!"
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
	
	if gametrainMap == null:
		var trainMap_game_scene = preload("res://GameTrainMap.tscn").instantiate()
		
		gametrainMap = trainMap_game_scene
		add_child(gametrainMap)
		print_tree()
	doctor.talking = true
	is_opened = true	
func close():
	
	if gametrainMap != null:
		remove_child(gametrainMap)
		gametrainMap.queue_free()
		gametrainMap = null
	doctor.talking = false
	is_opened = false
	
func mapcompleted():
	doctor.talking = false
	interaction_label.visible = false
	$ColorRect.visible = false
	$CollisionShape2D.queue_free()
	var parent = get_parent()
	parent.mapcomplete()



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
		doctor.speak(trainMapDialogue)


func _on_body_exited(body):
	interaction_label.visible = false
	inrange = false


