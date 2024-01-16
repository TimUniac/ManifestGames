extends Control

var secret_code = "1234"
var entered_code = ""

func _input(event):
	if event is InputEventKey and event.pressed and !event.echo:
		if event.keycode == KEY_1:
			_append_number_to_code(1)
			#PLAY G Chord
		elif event.keycode == KEY_2:
			_append_number_to_code(2)
			#PLAY
		elif event.keycode == KEY_3:
			_append_number_to_code(3)
		elif event.keycode == KEY_4:
			_append_number_to_code(4)
		elif event.keycode == KEY_5:
			_append_number_to_code(5)
		elif event.keycode == KEY_6:
			_append_number_to_code(6)
		elif event.keycode == KEY_7:
			_append_number_to_code(7)
		elif event.keycode == KEY_8:
			_append_number_to_code(8)
		elif event.keycode == KEY_9:
			_append_number_to_code(9)
			
		elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			_on_EnterButton_pressed()
		elif event.keycode == KEY_BACKSPACE and entered_code != "":
			entered_code = entered_code.substr(0, entered_code.length() - 1)
			$SequenceInput.text = entered_code


func _append_number_to_code(number):
	entered_code += str(number)
	$SequenceInput.text = entered_code

func _on_EnterButton_pressed():
	if entered_code == secret_code:
		print("Code Correct!")
		#PLAY SONG
		# Add more feedback here
	else:
		print("Incorrect Code")
		entered_code = ""
		$SequenceInput.clear()

# Rest of your code...
