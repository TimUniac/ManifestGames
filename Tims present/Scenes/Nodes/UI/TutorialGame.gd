extends Control

var secret_code = "P455W04D"
var secret_code2 = "P4SSWORD"
var secret_code3 = "P4SSW0RD"
var secret_code4 = "P455WO4D"
var secret_code5 = "PASSWORD"
var secret_code6 = "PA55WORD"
var secret_code7 = "P4SSW04D"
var secret_code8 = "PA55W0RD"
var secret_code9 = "PA55W04D"
var secret_code10 = "PASSW04D"
var entered_code = ""



func _ready():
	pass
	
	
signal codeCorrect

func _input(event):
	if event is InputEventKey and event.pressed and !event.echo:
		var key = OS.get_keycode_string(event.keycode).capitalize()
	
		if key in 'ABCDFGHIJKLMNOPQRSTUVWXYZ1234567890':  
			var sound_index = _get_sound_index_for_key(key)
			KeyboardInput.play_sound(sound_index)
			_append_letter_to_code(key)
		elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			_on_EnterButton_pressed()
		elif event.keycode == KEY_BACKSPACE and entered_code != "":
			entered_code = entered_code.substr(0, entered_code.length() - 1)
			$CanvasLayer/SequenceInput.text = entered_code
func _get_sound_index_for_key(key):
	# Define arrays for alphabet and numbers mapping to their respective indices
	var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var numbers = "1234567890"
	var base_index = 0

	if key in alphabet:
			base_index = alphabet.find(key)
	elif key in numbers:
		base_index = 10 + numbers.find(key)
		if key == '0':  
			base_index = 25

	return base_index
func _append_letter_to_code(letter):
	entered_code += letter
	$CanvasLayer/SequenceInput.text = entered_code

func _on_EnterButton_pressed():
	if entered_code == secret_code:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code2:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code3:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code4:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code5:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code6:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code7:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code8:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code9:
		print("Code Correct!")
		var parent = get_parent()
		parent.playercollect()
		parent.close()
	elif entered_code == secret_code10:
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



