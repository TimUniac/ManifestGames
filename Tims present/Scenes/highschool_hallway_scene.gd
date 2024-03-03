extends Node2D

@onready var doctor = $"Male Doctor Character"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Objectives/Label/Orbs.visible = false
	$Objectives/Label2/Orbs2.visible = false
	$Objectives/Label3/Orbs3.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$Objectives.visible = !$Objectives.visible
