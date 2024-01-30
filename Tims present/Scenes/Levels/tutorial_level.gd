extends Node2D
@export var collected_items: int = 0

@onready var music = $TutorialMusic

func _ready():
	$Finish.visible = false
	var doctor = $"Male Doctor Character"
	var tutorial = $Files
	music.stream.loop = true
	
func _input(event):
	item_count()
	hide_show_objectives()
	
func _process(delta):
	change_scene()
	
func item_count():
	if Input.is_action_just_pressed("Pickup"):
		collected_items += 1
		print (collected_items)
	if collected_items == 3:
		$Finish.visible = true
	
func change_scene():
	if Input.is_action_just_pressed("Next"):
		get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		if $Objectives.visible == true:
			$Objectives.visible = false
		elif $Objectives.visible == false:
			$Objectives.visible = true
