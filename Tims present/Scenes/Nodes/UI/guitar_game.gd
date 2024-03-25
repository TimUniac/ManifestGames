extends Control



var total_pieces = 4  # Updated the total number of pieces to 4
var pieces_snapped = 0
@onready var root = $"."
var correct_order = {"eMinor": 1, "C": 2, "G": 3, "D":4} 

func _ready():
	root.visible = true
func snapped_pieces(piece_id):
	pieces_snapped += 1
	print(pieces_snapped)
	if pieces_snapped == total_pieces:
		if check_order():
			winstate()


		else:
			print("Pieces are in the wrong order.")
func unsnapped_pieces():
	pieces_snapped -= 1
	print(pieces_snapped)
	
func winstate():    
	print("All pieces correctly placed in the right order!")
	for child in get_children():
		if child.has_method("winHide"):
			child.winHide()
	var timer = await get_tree().create_timer(3.0).timeout
	var parent = get_parent()
	parent.solvedpuzzle()
	parent.close()
	parent.playersolved_puzzle()

func check_order():
	var snapped_pieces_order = []
	for child in get_children():
		if "piece_id" in child and child.isSnapped:
			snapped_pieces_order.append(correct_order[child.piece_id])
	snapped_pieces_order.sort()
	for i in range(len(snapped_pieces_order) - 1):
		if snapped_pieces_order[i] + 1 != snapped_pieces_order[i + 1]:
			return false
	return true
	
func _on_close_pressed():
	var parent = get_parent()
	parent.close()
