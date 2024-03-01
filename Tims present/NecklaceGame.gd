extends Control

var secret_code = "AVA" #answer to puzzle
var typed_code = ""
var entered_code = ""
var sequence = 0

func _process(_delta): #checks if entered code matches the secret code
	if entered_code == secret_code:
		print("Necklace Correct!")
		typed_code = ""
		entered_code = ""
		var parent = get_parent()
		if parent and parent.has_method("playercollect"):
			parent.playercollect()
			parent.close()
		else:
			print("No method necklace")
	

func _ready():
	pass
	
	


func _append_letter_to_code(typed_code):
	entered_code = typed_code
	$CanvasLayer/NecklaceSequenceInput.text = entered_code



func _on_letter_a_button_down():
	if sequence == 0 or sequence == 2:
		typed_code += "A"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
func _on_letter_v_button_down():
	if sequence == 1:
		typed_code += "V"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1


func _on_texture_button_pressed():
	var parent = get_parent()
	parent.close()
	
