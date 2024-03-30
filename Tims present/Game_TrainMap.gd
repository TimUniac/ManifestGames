extends Control

var points = [] # Correct initialization for an empty array
var correct_sequence = [1, 7, 13, 14, 2] # Assuming IDs for simplicity
var line2d # Reference to the Line2D node

func _ready():
	$Schedule.visible = false
	line2d = $Line2D # Adjust the path according to your scene tree
	for i in range(1, 18):
		var point_path = "Point" + str(i)
		var point = get_node(point_path)
		point.connect("input_event", Callable(self, "_on_Point_input_event"), [i])

func _on_close_pressed():
	$Schedule.visible = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Schedule.visible = !$Schedule.visible

func _on_Point_input_event(viewport, event, shape_idx, point_id):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var point_node = get_node("Point" + str(point_id))
		var point_position = point_node.global_position
		points.append(point_id)
		line2d.points.append(point_position)
		
		if len(points) == correct_sequence.size():
			if points == correct_sequence:
				winstate()
			else:
				reset()

func winstate():
	print("Puzzle Solved!")

func reset():
	line2d.points.clear()
	points.clear()
