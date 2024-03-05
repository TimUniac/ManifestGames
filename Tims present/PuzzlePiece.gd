extends Sprite2D

var is_dragging = false
var original_position = Vector2()
var drag_offset = Vector2()
@export var target_position = Vector2()
@onready var root = $".."
func _ready():
	original_position = position

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if is_dragging and not event.pressed:
			
			is_dragging = false
			check_snap_position()
		elif !is_dragging and event.pressed and get_rect().has_point(to_local(event.global_position)):
			# Pick up the piece
			is_dragging = true
			drag_offset = position - event.global_position
			modulate = Color(1, 1, 1, 0.5)  # Example way to show a shadow effect
			z_index += 1  # Increase z_index to bring to front temporarily

	if is_dragging and event is InputEventMouseMotion:
		position = event.global_position + drag_offset

func check_snap_position():
	if position.distance_to(target_position) <= 25:
		position = target_position
		modulate = Color(1, 1, 1, 1)  # Remove shadow effect
		z_index -= 1  # Reset z_index to its original value
		root.snapped_pieces()
	else:
		modulate = Color(1, 1, 1, 1)  
