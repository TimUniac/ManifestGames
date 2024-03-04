extends Area2D

var dragging = false
var drag_offset = Vector2()
@export var target_position = Vector2()  # Set this for each piece
var tolerance = 10.0
signal piece_placed_correctly
@onready var parent = $".."
# Signal connections (done via the editor or programmatically in _ready)
func _ready():
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	connect("input_event", Callable(self, "_on_input_event"))

func _on_mouse_entered():
	# Optional: Change cursor to indicate draggable
	Input.set_default_cursor_shape(Input.CURSOR_DRAG)

func _on_mouse_exited():
	# Optional: Revert cursor change
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Start dragging
				dragging = true
				drag_offset = global_position - get_global_mouse_position()
			else:
				# Stop dragging
				dragging = false
	elif event is InputEventMouseMotion and dragging:
		# Move the parent Sprite2D
		parent.global_position = get_global_mouse_position() + drag_offset

func _on_drag_end():  # Call this when the drag operation for the piece ends
	if position.distance_to(target_position) <= tolerance:
		position = target_position  
		emit_signal("piece_placed_correctly", self)


func _on_piece_placed_correctly():
	pass # Replace with function body.