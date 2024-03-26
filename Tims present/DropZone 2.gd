extends Area2D

@export var correct_tile = ""
@export var exclusionGroup = ""
signal correctTile
signal wrongTile
# Called when the node enters the scene tree for the first time.
func checkTile(tile_id):
	if tile_id == correct_tile:
		emit_signal("correctTile")
	else:
		emit_signal("wrongTile")
