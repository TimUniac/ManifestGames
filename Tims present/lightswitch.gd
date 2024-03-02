extends TextureButton

@onready var root = $"../../.."
var switchON: Texture
var switchOFF: Texture
signal switch
signal lightON
signal lightOff

var ON = true 

func _ready():
	switchON = preload("res://Assets/Texture assets/Chapter 2/LightSwitch_ON_V2.jpg")
	switchOFF = preload("res://Assets/Texture assets/Chapter 2/LightSwitch_OFF_V2.jpg")
	self.texture_normal = switchON

func _pressed():
	switcher()
	emit_signal("switch")
		
func switcher():
	if ON == false:
		self.texture_normal = switchON
		ON = true
		root.lightOn()
	elif ON == true:
		self.texture_normal = switchOFF
		ON = false
		root.lightOff()


