extends Marker2D

var has_checked_input: bool = false

func _process(delta):
	# Check if input hasn't been checked yet
	if not has_checked_input:
		# Example condition: Check if any movement key is pressed
		if Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
			Dialogic.start('tutorial')
			get_viewport().set_input_as_handled()
			has_checked_input = true

func _input(event:InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return

	if event is InputEventKey and event.keycode == KEY_UP and event.pressed:
		Dialogic.start('tutorial')
		get_viewport().set_input_as_handled()
