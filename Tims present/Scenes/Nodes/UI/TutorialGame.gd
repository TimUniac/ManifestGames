extends Control

var secret_code = "P455W04D"
var entered_code = ""

func _ready():
	pass

func _input(event):
	if event is InputEventKey and event.pressed and !event.echo:
		var key = OS.get_keycode_string(event.keycode).capitalize()
		if event.keycode != KEY_ENTER and event.keycode != KEY_KP_ENTER and event.keycode != KEY_BACKSPACE:
			_append_letter_to_code(key)
		elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			_on_EnterButton_pressed()
		elif event.keycode == KEY_BACKSPACE and entered_code != "":
			entered_code = entered_code.substr(0, entered_code.length() - 1)
			$SequenceInput.text = entered_code

func _append_letter_to_code(letter):
	entered_code += letter
	$SequenceInput.text = entered_code

func _on_EnterButton_pressed():
	if entered_code == secret_code:
		print("Code Correct!")
		var parent_node = get_parent()
		if parent_node and parent_node.has_method("playercollect"):
			parent_node.playercollect()
			parent_node.close()
			$"..".visible = false
		else:
			print("Parent node doesn't have the 'playercollect' method.")
	else:
		print("Incorrect Code")
		entered_code = ""
		$SequenceInput.clear()