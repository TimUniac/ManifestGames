extends Sprite2D

var drag_offset = Vector2()
var dragging = false
var original_position = Vector2()
var inDropZone = false
var correctDropZone = null  # Assign this based on your game logic
@export var tile_id = ""

var correctSpace = false

func _ready():
	original_position = position
	set_process(true)



func _process(delta):
	if dragging == true:
		position = get_global_mouse_position() + drag_offset



func _on_area_2d_correct_tile():
	correctSpace = true

func _on_area_2d_wrong_tile():
	correctSpace = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_offset = position - get_global_mouse_position()
			inDropZone = false  # Reset drop zone flag
		elif event is InputEventMouseButton:
			dragging = false
			checkDropZone()
	if inDropZone:
			# Snap to the center of the correct drop zone
		position = correctDropZone.global_position
	else:
			# Return to original position if not dropped in a correct zone
		return

func checkDropZone():
	var area2d= $Area2D
	for area in area2d.get_overlapping_areas():

		if area.has_method("checkTile") and area.checkTile(tile_id):
			global_position = area.global_position
			$"../SnapSound".play()


func _on_strum_pressed():
	var parent = get_parent()
	if correctSpace == true:
		print ("eMin")
		parent.tileCount()
		settleTile()
	if correctSpace == false:
		position = original_position
		$"../WrongChords".play()
		parent.correctTiles = 0
func settleTile():
	set_process(false) 
	$".".modulate = Color(0, 1, 0, 1)
