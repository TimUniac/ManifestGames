extends Node2D
@onready var answer = $Control/TextureRect
@onready var blocker = $ColorRect2
var total_pieces = 8 
var pieces_snapped = 0
@onready var root = $"."

func _ready():
	answer.visible = false
	root.visible = true
func snapped_pieces():
	pieces_snapped += 1
	print(pieces_snapped)
	if pieces_snapped == total_pieces:
		winstate()
		blocker.visible = false
		answer.visible = true
func unsnapped_pieces():
	pieces_snapped -= 1
	print(pieces_snapped)
	
func winstate():	
	print("All pieces correctly placed!")
	for child in get_children():
		if child.has_method("winHide"):
			child.winHide()
	var timer = await get_tree().create_timer(3.0).timeout
	var parent = get_parent()
	parent.solvedpuzzle()
	parent.close()
	parent.playersolved_puzzle()


func _on_close_pressed():
	var parent = get_parent()
	parent.close()
