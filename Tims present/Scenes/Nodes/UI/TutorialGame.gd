extends Control

var secret_code = "P455W04D"
var entered_code = ""



func _ready():
	pass
	
	
signal codeCorrect

func _input(event):
	if event is InputEventKey and event.pressed and !event.echo:
		var key = OS.get_keycode_string(event.keycode).capitalize()
		
		if key in 'ABCDFGHIJKLMNOPQRSTUVWXYZ1234567890':  
			_append_letter_to_code(key)
		elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			_on_EnterButton_pressed()
		elif event.keycode == KEY_BACKSPACE and entered_code != "":
			entered_code = entered_code.substr(0, entered_code.length() - 1)
			$CanvasLayer/SequenceInput.text = entered_code

func _append_letter_to_code(letter):
	entered_code += letter
	$CanvasLayer/SequenceInput.text = entered_code

func _on_EnterButton_pressed():
	if entered_code == secret_code:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	else:
		print("Incorrect Code")
		entered_code = ""
		$CanvasLayer/SequenceInput.clear()


func _on_close_pressed():
	var parent = get_parent()
	parent.close()



