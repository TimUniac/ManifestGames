extends Area2D

signal lightposter_interacted(lightposterDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Interactionarea
@onready var doctor = get_parent().get_node("Male Doctor Character")



@onready var sprite = $Sprite2D
@onready var talking = false
@onready var openedlocker = $OpenedLocker	
@onready var closedlocker = $ClosedLocker
@onready var objlist = $"../Objectives"

var player = null
var inrange = false
var collect = false
var is_opened = false
var opened = false

var gamelightposter = null
@onready var lightposterDialogue: String = "It looks Seraphina has a sensitivity towards light, we should help turn them off!"
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
	
	if gamelightposter == null:
		var lightposter_game_scene = preload("res://lightswitch.tscn").instantiate()
		
		gamelightposter = lightposter_game_scene
		add_child(gamelightposter)
		print_tree()
	doctor.talking = true
	is_opened = true	
func close():
	
	if gamelightposter != null:
		remove_child(gamelightposter)
		gamelightposter.queue_free()
		gamelightposter = null
	doctor.talking = false
	is_opened = false
	
func lightsturnedoff():
	doctor.talking = false
	$Interactionarea.visible = false
	$Interactionarea/CollisionShape2D.queue_free()
	
	
		

signal item_collected()

func playerturnedofflights():
	emit_signal("item_collected")
	visible = false
	$Interactionarea.queue_free()
	objlist.turnedoffthelights()
	print ("player turned off lights")




func _on_interactionarea_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(lightposterDialogue)


func _on_interactionarea_body_exited(body):
	interaction_label.visible = false
	inrange = false
