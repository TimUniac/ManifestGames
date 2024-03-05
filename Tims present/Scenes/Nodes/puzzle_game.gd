extends Node2D


var total_pieces = 1
var pieces_snapped = 0

func snapped_pieces():
	pieces_snapped += 1
	print(pieces_snapped)
	if pieces_snapped == total_pieces:
		winstate()

func winstate():
	print("All pieces correctly placed!")
	# Implement your win state logic here
