extends Control

var secret_code = "CARMILLA"
var typed_code = ""
var entered_code = ""
var sequence = 0

func _process(_delta): #checks if entered code matches the secret code
	if entered_code == secret_code:
		print("Book Correct!")
		typed_code = ""
		entered_code = ""
		var parent = get_parent()
		if parent and parent.has_method("playercollect"):
			parent.playercollect()
			parent.close()
			
		else:
			print ("No such method")


	



func _append_letter_to_code(typed_code):
	entered_code = typed_code
	$CanvasLayer/SequenceInput.text = entered_code



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


func _on_texture_button_pressed():
	var parent= get_parent()
	parent.close()
