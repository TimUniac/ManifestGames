extends Sprite2D

var is_dragging = false
var original_position = Vector2()
var drag_offset = Vector2()
@export var target_position = Vector2()
@onready var root = get_node("..")
var isSnapped = false

func _ready():
	original_position = position

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if is_dragging and not event.pressed:
			is_dragging = false
			check_snap_position()
		elif !is_dragging and event.pressed and get_rect().has_point(to_local(event.global_position)):
			is_dragging = true
			drag_offset = position - event.global_position
			modulate = Color(1, 1, 1, 0.5)
			z_index += 1
			# Call unsnapped_pieces if the piece was previously snapped and is now being dragged.
			if isSnapped:
				root.unsnapped_pieces()
				isSnapped = false  # Mark as unsnapped since it's being moved.
	
	if is_dragging and event is InputEventMouseMotion:
		position = event.global_position + drag_offset

func check_snap_position():
	if position.distance_to(target_position) <= 25:
		if not isSnapped:  # Only snap if it was not already snapped
			position = target_position
			modulate = Color(.8, .8, 1, 1)
			z_index -= 1  # Reset z_index to its original value
			root.snapped_pieces()
			isSnapped = true
	else:
		modulate = Color(1, 1, 1, 1)
		if isSnapped:
			root.unsnapped_pieces()
			isSnapped = false

func winHide():
	self.visible = false
