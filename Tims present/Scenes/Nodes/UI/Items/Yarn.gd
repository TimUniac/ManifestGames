extends Area2D


@export var action_name: String = "interact"
@onready var interaction_label = $Panel

@export var item: InvItem
@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
var player = null
var inrange = false
var collect = false
var is_opened = false

func _ready():
	interaction_label.visible = false
	$BookGame.visible = false


func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		
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
	$BookGame/SequenceInput.clear()
	$BookGame.visible = true
	is_opened = true		
func close():
	$BookGame.visible = false
	is_opened = false
		

func playercollect():
	player.collect_item(1)
	print("player")

