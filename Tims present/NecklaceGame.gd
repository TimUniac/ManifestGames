extends Control

var secret_code = "AVA"
var entered_code = ""



func _ready():
	pass
	
func _input(event):
	if event is InputEventKey and event.pressed and !event.echo:
		var key = OS.get_keycode_string(event.keycode).capitalize()
		
		if key in 'ABCFGHIJKLMNOPQRSTUVXYZ':  # Check if the key is an alphabet letter
			_append_letter_to_code(key)
		elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			_on_EnterButton_pressed()
		elif event.keycode == KEY_BACKSPACE and entered_code != "":
			entered_code = entered_code.substr(0, entered_code.length() - 1)
			$NecklaceSequenceInput.text = entered_code


func _append_letter_to_code(letter):
	entered_code += letter
	$NecklaceSequenceInput.text = entered_code

func _on_EnterButton_pressed():
	if entered_code == secret_code:
		print("Code Correct!")
		var parent = get_parent()
		var grandparent = parent.get_parent()
		if grandparent and grandparent.has_method("playercollect"):
			grandparent.playercollect()
			grandparent.close()
			grandparent.queue_free()
			$"..".visible = false
			
		else:
			print("Parent node doesn't have the 'playercollect' method.")
	else:
		print("Incorrect Code")
		entered_code = ""
		$NecklaceSequenceInput.clear()


