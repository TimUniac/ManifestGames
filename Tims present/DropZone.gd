extends Area2D

@export var correct_tile = ""
@export var exclusionGroup = ""
signal correctTile
signal wrongTile

var tile_ids = {}

func _ready():
	connect("area_entered", _on_area_entered)
	
func checkTile(tile_id):
	if tile_id == correct_tile:
		emit_signal("correctTile")
	else:
		emit_signal("wrongTile")

func _on_area_entered(area):
	var tile = area.get_parent()
	if tile and tile.is_class("Sprite2D"):
		tile_ids[area] = tile.tile_id
		if tile.has_signal("tile_dropped"):
			print("Attempting to connect from: ", tile.name, " of type: ", tile.get_class())
			# Use Callable for connecting signals in Godot 4, allowing to specify the method and its parameters.
			tile.connect("tile_dropped", _on_tile_dropped)

func _on_tile_dropped(tile_id):
	print("Tile ID is: ", tile_id)
	checkTile(tile_id)
