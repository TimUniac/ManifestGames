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
	switch_neighbors()
func switcher():
	if ON == false:
		self.texture_normal = switchON
		ON = true
		root.lightOn()
	elif ON == true:
		self.texture_normal = switchOFF
		ON = false
		root.lightOff()
func switch_neighbors():
	var ids_to_switch = []
	var grid_width = 5
	
# Calculate the neighbors
	var up = button_id - grid_width if button_id > grid_width else 0
	var down = button_id + grid_width if button_id <= (grid_width * (grid_width - 1)) else 0
	var left = button_id - 1 if button_id % grid_width != 1 else 0
	var right = button_id + 1 if button_id % grid_width != 0 else 0

	ids_to_switch.append(up) if up else 0
	ids_to_switch.append(down) if down else 0
	ids_to_switch.append(left) if left else 0
	ids_to_switch.append(right) if right else 0

	# Switch the state of each neighbor
	for id in ids_to_switch:
		if id == 0:
			continue
		var neighbor = root.get_node("switch_" + str(id))
		if neighbor:
			neighbor.switcher()


