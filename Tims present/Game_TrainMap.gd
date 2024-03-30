extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	$Schedule.visible = false
	#$Map/Area2D.mouse_filter = Control.MOUSE_FILTER_PASS



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_pressed():
	$Schedule.visible = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Schedule.visible = !$Schedule.visible
