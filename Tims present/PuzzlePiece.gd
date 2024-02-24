extends Sprite2D

var dragging = false
var clickAndDragOffset = Vector2()
var snapThreshold = 10

func _ready():
	set_process_input(true)

func _process(delta):
	if dragging: 
		return
	var snap_points = get_tree().get_nodes_in_group("PiecePlaces")
	for point in snap_points:
		if position.distance_to(point.position) < snapThreshold:
			position = point.position
			set_process_input(false)
			break

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and get_rect().has_point(to_local(event.position)):
				dragging = true
				clickAndDragOffset = to_local(event.position) - position
			else:
				dragging = false
	elif event is InputEventMouseMotion:
		if dragging:
			position = to_local(event.position) - clickAndDragOffset
