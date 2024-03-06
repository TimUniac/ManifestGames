extends Area2D


@export var action_name: String = "interact"
@onready var interaction_label = $Panel


@onready var objlist = $"../Objectives"
@onready var sprite = $Sprite2D
var player = null
var inrange = false
var collect = false


func _ready():
	interaction_label.visible = false



func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		
func _on_body_exited(_body):
	interaction_label.visible = false
	inrange = false

func _process(_delta):
	if inrange and Input.is_action_just_pressed("Interact"):
		playercollect()
		visible = false

		
		

signal item_collected

func playercollect():
	emit_signal("item_collected")
	visible = false
	objlist.foundglasses()
