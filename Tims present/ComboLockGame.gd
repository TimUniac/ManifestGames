extends Control

var sequence = ["red", "blue", "yellow", "green"]
var current_index = 0
var red = false
var blue = false
var green = false
var yellow = false

@onready var  game = $".."
@export var red_button_normal_original: Texture
@export var blue_button_normal_original: Texture
@export var green_button_normal_original: Texture
@export var yellow_button_normal_original: Texture

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
		
	var yellow_button = $yellowButton as TextureButton
	if yellow_button_normal_original:
		yellow_button.texture_normal = yellow_button_normal_original
		
func _on_red_button_pressed():
	var button = $redButton
	if blue == false and green == false and yellow == false:
		red = true
		button.texture_normal = button.texture_pressed
	else:
		print ("wrong answer")
		reset_buttons()

func _on_blue_button_pressed():
	var button = $blueButton
	if red == true and green == false and yellow == false:
		blue = true
		button.texture_normal = button.texture_pressed
	else:
		print ("wrong answer")
		red = false
		blue = false
		green = false
		yellow = false

func _on_green_button_pressed():
	var button = $greenButton
	if red == true and yellow == true and blue == true:
		green = true
		print ("open Locker")
		var parent = get_parent()
		var grandpa = parent.get_parent()
		var greatgramps = grandpa.get_parent()
		greatgramps.open_locker()
		button.texture_normal = button.texture_pressed
		game.visible = false 
	else:
		print ("wrong answer")
		reset_buttons()
		
func _on_yellow_button_pressed():
	var button = $yellowButton
	if red == true and green == false and blue == true:
		yellow = true
		button.texture_normal = button.texture_pressed
	else:
		print ("wrong answer")
		reset_buttons()

func reset_buttons():
	red = false
	blue = false
	green = false
	yellow = false
	$redButton.texture_normal = red_button_normal_original
	$blueButton.texture_normal = blue_button_normal_original
	$greenButton.texture_normal = green_button_normal_original
	$yellowButton.texture_normal = yellow_button_normal_original
