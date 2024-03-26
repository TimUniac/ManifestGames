extends Sprite2D

var drag_offset = Vector2()
var dragging = false
var original_position = Vector2()
var inDropZone = false
var correctDropZone = null  # Assign this based on your game logic
@export var tile_id = "" 
@onready 	var area2d= $Area2D
var correctSpace = false
signal tile_dropped(tile_id)

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
			print ("1")
			dragging = true
			print ("2")
			drag_offset = global_position - get_global_mouse_position()
			print ("3")
			position = get_global_mouse_position() + drag_offset
			print ("4")
			#inDropZone = false  # Reset drop zone flag
			print ("5")
		else:
			print ("6")
			dragging = false
			print ("7")
			tileDropped()
			print ("8")
			checkDropZone()
			print ("9")
	if inDropZone:

		position = correctDropZone.global_position
	else:
		
		return
func tileDropped():
	emit_signal("tile_dropped", tile_id)
	
func checkDropZone():

	for area in area2d.get_overlapping_areas():
		if area.owner and area.owner.has_method("checkTile"):
			area.owner.checkTile(tile_id)
		if global_position.distance_to(area2d.global_position) <= 10:
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


