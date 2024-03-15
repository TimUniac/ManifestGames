extends Control

var secret_code = "CARMILLA"
var typed_code = ""
var entered_code = ""
var sequence = 0


func _ready():
	KeyboardInput.volume_db = -80.0
	
func _process(delta): #checks if entered code matches the secret code
	if entered_code == secret_code:
		print("Code Correct!")
		typed_code = ""
		entered_code = ""
		var parent = get_parent()
		KeyboardInput.volume_db = -80
		if parent and parent.has_method("playercollect"):
			parent.playercollect()
			parent.close()
			parent.queue_free()
			
func _append_letter_to_code(typed_code):
	entered_code = typed_code
	$CanvasLayer/SequenceInput.text = entered_code


func wait(seconds: float, letter) -> void:
	await get_tree().create_timer(seconds).timeout
	letter.visible = true

func _on_letter_c_button_down():
	KeyboardInput.play_sound(2)
	if sequence == 0:
		typed_code += "C"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_C".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_C")
func _on_letter_a_button_down():
	KeyboardInput.play_sound(0)
	if sequence == 1 or sequence == 7:
		typed_code += "A"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_A".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_A")
func _on_letter_r_button_down():
	KeyboardInput.play_sound(17)
	if sequence == 2:
		typed_code += "R"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_R".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_R")
func _on_letter_m_button_down():
	KeyboardInput.play_sound(12)
	if sequence == 3:
		typed_code += "M"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_M".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_M")
func _on_letter_i_button_down():
	KeyboardInput.play_sound(8)
	if sequence == 4:
		typed_code += "I"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_I".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_I")
func _on_letter_l_button_down():
	KeyboardInput.play_sound(11)
	if sequence == 5 or sequence == 6:
		typed_code += "L"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasLayer/CanvasGroup/letter_L".visible = false
	wait(1.0, $"CanvasLayer/CanvasGroup/letter_L")


func _on_texture_button_pressed():
	KeyboardInput.mute(true)
	var parent = get_parent()
	parent.close()
