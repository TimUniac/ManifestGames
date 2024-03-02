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
		var grandparent = parent.get_parent()
		if grandparent and grandparent.has_method("playercollect"):
			grandparent.playercollect()
			grandparent.close()
			$"..".visible = false
	

func _ready():
	pass
	
func wait(seconds: float, letter) -> void:
	await get_tree().create_timer(seconds).timeout
	letter.visible = true
	
	
#This is what Tim and Stephane did, IDK I'm not touching this
#func _input(event):
	#if event is InputEventKey and event.pressed and !event.echo:
		#var key = OS.get_keycode_string(event.keycode).capitalize()
		
		#if key in 'ABCFGHIJKLMNOPQRSTUVXYZ':  # Check if the key is an alphabet letter
			#_append_letter_to_code(key)
		#elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			#_on_EnterButton_pressed()
		#elif event.keycode == KEY_BACKSPACE and entered_code != "":
			#entered_code = entered_code.substr(0, entered_code.length() - 1)
			#$NecklaceSequenceInput.text = entered_code
#func _input(event):
	#if event is InputEventKey and event.pressed and !event.echo:
		#var key = OS.get_keycode_string(event.keycode).capitalize()
		
		#if KEY_BACKSPACE and entered_code != "":
			#typed_code = typed_code.substr(0, entered_code.length() - 1)
			#$NecklaceSequenceInput.text = entered_code


func _append_letter_to_code(typed_code):
	entered_code = typed_code
	$NecklaceSequenceInput.text = entered_code

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
		#$NecklaceSequenceInput.clear()

func _on_letter_a_button_down():
	if sequence == 0 or sequence == 2:
		typed_code += "A"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasGroup/letter_A".visible = false
	wait(1.0, $"CanvasGroup/letter_A")
func _on_letter_v_button_down():
	if sequence == 1:
		typed_code += "V"
		_append_letter_to_code(typed_code)
		print(typed_code)
		sequence += 1
	$"CanvasGroup/letter_V".visible = false
	wait(1.0, $"CanvasGroup/letter_V")
func _on_letter_i_button_down():
	$"CanvasGroup/letter_I".visible = false
	wait(1.0, $"CanvasGroup/letter_I")
func _on_letter_e_button_down():
	$"CanvasGroup/letter_E".visible = false
	wait(1.0, $"CanvasGroup/letter_E")
func _on_letter_s_button_down():
	$"CanvasGroup/letter_S".visible = false
	wait(1.0, $"CanvasGroup/letter_S")
