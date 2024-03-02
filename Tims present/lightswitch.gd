extends Button

var switchON: Texture
var switchOFF: Texture
signal toggle_neighbors(x, y)

var is_on = true # Track the state of the light

func _ready():
	switchON = preload("res://Assets/Texture assets/Chapter 2/LightSwitch_ON_V2.jpg")
	switchOFF = preload("res://Assets/Texture assets/Chapter 2/LightSwitch_OFF_V2.jpg")
	self.texture_normal = switchON

func _pressed():
	if self.texture_normal == switchON:
		self.texture_normal = switchOFF
#		emit_signal("toggle_neighbors", grid_x, grid_y) # Assuming grid_x and grid_y are set based on the light's position in the grid
	else:
		self.texture_normal = switchON


