extends Node2D
@export var collected_items: int = 0

func _ready():
	$FinishText.visible = false
func _input(event):
	item_count()
	
func _process(delta):
	change_scene()
	
func item_count():
	if Input.is_action_just_pressed("Pickup"):
		collected_items += 1
		print (collected_items)
	if collected_items == 3:
		$FinishText.visible = true
	
func change_scene():
	if Input.is_action_just_pressed("Next"):
		get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")

