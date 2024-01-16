extends Control

var secret_code = "1234"
var entered_code = ""

func _on_NumberButton_pressed(number):
	entered_code += str(number)
	$LineEdit.text = entered_code

func _on_EnterButton_pressed():
	if entered_code == secret_code:
		print("Code Correct!")
		# Add more feedback here
	else:
		print("Incorrect Code")
		entered_code = ""
		$SequenceInput.clear()

func _ready():
	# Connect each button to a function
	for i in range(1, 10):
		var button_name = "Button" + str(i)
		var button = $GuitarGame.get_node(button_name)
		button.connect("pressed", self, "_on_NumberButton_pressed", [i])

func _on_button_pressed(number):
	$SequenceInput.text = str(number)
