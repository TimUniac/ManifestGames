extends Node2D
@onready var answer = $Control/TextureRect
@onready var blocker = $Control/ColorRect2
var total_pieces = 9
var pieces_snapped = 0

func _ready():
	answer.visible = false
	
func snapped_pieces():
	pieces_snapped += 1
	print(pieces_snapped)
	if pieces_snapped == total_pieces:
		winstate()
		blocker.visible = false
		answer.visible = true

func winstate():
	print("All pieces correctly placed!")
