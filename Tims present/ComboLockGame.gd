extends Control

var sequence = ["red", "blue", "pink", "green"]
var current_index = 0
var red = false
var blue = false
var green = false
var pink = false

var soundRed: AudioStream
var soundBlue: AudioStream
var soundPink: AudioStream
var soundGreen: AudioStream
@onready var  game = $".."
@onready var audioPlayer = $AudioStreamPlayer2D
@export var red_button_normal_original: Texture
@export var blue_button_normal_original: Texture
@export var green_button_normal_original: Texture
@export var pink_button_normal_original: Texture

func _ready():
	
	var red_button = $redButton as TextureButton
	if red_button_normal_original:
		red_button.texture_normal = red_button_normal_original
		
	var blue_button = $blueButton as TextureButton
	if blue_button_normal_original:
		blue_button.texture_normal = blue_button_normal_original
		
	var green_button = $greenButton as TextureButton
	if green_button_normal_original:
		green_button.texture_normal = green_button_normal_original
		
	var pink_button = $pinkButton as TextureButton
	if pink_button_normal_original:
		pink_button.texture_normal = pink_button_normal_original
		
	soundRed = load ("res://Assets/Sound/SFX/ComboLock/Red.mp3")
	soundBlue = load ("res://Assets/Sound/SFX/ComboLock/Blue.mp3")
	soundPink = load ("res://Assets/Sound/SFX/ComboLock/Pink.mp3")
	soundGreen = load ("res://Assets/Sound/SFX/ComboLock/Green.mp3")
func _on_red_button_pressed():
	print (red and blue and green and pink)
	var button = $redButton
	print ("red 1")
	if blue == false and green == false and pink == false:
		red = true
		button.texture_normal = button.texture_pressed
		print ("red 2")
	else:
		print ("wrong answer")
		reset_buttons()
		print ("red 3")
	
	print ("red 4")
	
func _on_blue_button_pressed():
	var button = $blueButton

	if red == true and green == false and pink == false:
		blue = true
		button.texture_normal = button.texture_pressed
	else:
		print ("wrong answer")
		red = false
		blue = false
		green = false
		pink = false
	audioPlayer.stream = soundBlue
	print (audioPlayer.stream)
	audioPlayer.play()
	

func _on_pink_button_pressed():
	var button = $pinkButton

	if red == true and green == false and blue == true:
		pink = true
		button.texture_normal = button.texture_pressed
	else:
		print ("wrong answer")
		reset_buttons()
	audioPlayer.stream = soundPink
	print (audioPlayer.stream)
	audioPlayer.play()
	
func _on_green_button_pressed():
	var button = $greenButton
	if red == true and pink == true and blue == true:
		green = true
		print ("open Locker")
		audioPlayer.stream = soundGreen
		print (audioPlayer.stream)
		audioPlayer.play()
		var parent = get_parent()
		var grandpa = parent.get_parent()
		var greatgramps = grandpa.get_parent()
		greatgramps.open_locker()
		button.texture_normal = button.texture_pressed
		game.visible = false 
	else:
		print ("wrong answer")
		reset_buttons()

func reset_buttons():
	red = false
	blue = false
	green = false
	pink = false
	$redButton.texture_normal = red_button_normal_original
	$blueButton.texture_normal = blue_button_normal_original
	$greenButton.texture_normal = green_button_normal_original
	$pinkButton.texture_normal = pink_button_normal_original
