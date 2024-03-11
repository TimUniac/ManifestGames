extends Control

var secret_code = "AVA" #answer to puzzle
var typed_code = ""
var entered_code = ""
var sequence = 0

func _process(delta): #checks if entered code matches the secret code
	if entered_code == secret_code:
		print("Code Correct!")
		typed_code = ""
		entered_code = ""
		var parent = get_parent()
		if parent and parent.has_method("playercollect"):
			parent.playercollect()
			parent.close()
	
	

func _ready():
	pass
	
func wait(seconds: float, letter) -> void:
	await get_tree().create_timer(seconds).timeout
	letter.visible = true
	
	


func _append_letter_to_code(typed_code):
	entered_code = typed_code
	$Camera2D/CanvasLayer/NecklaceSequenceInput.text = entered_code



func _on_letter_a_button_down():
	if sequence == 0 or sequence == 2:
		typed_code += "A"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_A".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_A")
func _on_letter_v_button_down():
	if sequence == 1:
		typed_code += "V"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_V".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_V")
func _on_letter_i_button_down():
	$"CanvasLayer/CanvasGroup/letter_I".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_I")
func _on_letter_e_button_down():
	$"CanvasLayer/CanvasGroup/letter_E".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_E")
func _on_letter_s_button_down():
	$"CanvasLayer/CanvasGroup/letter_S".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_S")


func _on_texture_button_pressed():
	var parent = get_parent()
	parent.close()
