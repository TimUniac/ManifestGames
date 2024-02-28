extends Control

var secret_code = "CARMILLA"
var typed_code = ""
var entered_code = ""
var sequence = 0

func _process(delta): #checks if entered code matches the secret code
	if entered_code == secret_code:
		print("Code Correct!")
		typed_code = ""
		entered_code = ""
		var parent = get_parent()
		var grandparent = parent.get_parent()
		if grandparent and grandparent.has_method("playercollect"):
			grandparent.playercollect()
			grandparent.close()
			$"..".visible = false


func _ready():
	pass
	
#func _input(event):
	#if event is InputEventKey and event.pressed and !event.echo:
		#var key = OS.get_keycode_string(event.keycode).capitalize()
		
		#if key in 'ABCFGHIJKLMNOPQRSTUVXYZ':  
			#_append_letter_to_code(key)
		#elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			#_on_EnterButton_pressed()
		#elif event.keycode == KEY_BACKSPACE and entered_code != "":
			#entered_code = entered_code.substr(0, entered_code.length() - 1)
			#$SequenceInput.text = entered_code


func _append_letter_to_code(typed_code):
	entered_code = typed_code
	$SequenceInput.text = entered_code

#func _on_EnterButton_pressed():
	#if entered_code == secret_code:
		#print("Code Correct!")
		#var parent = get_parent()
		#var grandparent = parent.get_parent()
		#if grandparent and grandparent.has_method("playercollect"):
			#grandparent.playercollect()
			#grandparent.close()
			#$"..".visible = false
			
		#else:
			#print("Parent node doesn't have the 'playercollect' method.")
	#else:
		#print("Incorrect Code")
		#entered_code = ""
		#$SequenceInput.clear()

func _on_letter_c_button_down():
	if sequence == 0:
		typed_code += "C"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
func _on_letter_a_button_down():
	if sequence == 1 or sequence == 7:
		typed_code += "A"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
func _on_letter_r_button_down():
	if sequence == 2:
		typed_code += "R"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
func _on_letter_m_button_down():
	if sequence == 3:
		typed_code += "M"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
func _on_letter_i_button_down():
	if sequence == 4:
		typed_code += "I"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
func _on_letter_l_button_down():
	if sequence == 5 or sequence == 6:
		typed_code += "L"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
