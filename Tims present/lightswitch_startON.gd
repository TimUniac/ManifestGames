extends TextureButton

@onready var root = $"../../.."
var switchON: Texture
var switchOFF: Texture
signal switch
signal lightON
signal lightOff
var switchID = 0
var ON = true 
@onready var parent = $".."

func _ready():
	switchON = preload("res://Assets/Texture assets/Chapter 2/LightSwitch_ON_V2.png")
	switchOFF = preload("res://Assets/Texture assets/Chapter 2/LightSwitch_OFF_V2.png")
	self.texture_normal = switchON
	switchID = int(name.split("_")[1]) #Set the switches ID
func _pressed():
	switcher()
	print ("pressed ",switchID)
	emit_signal("switch")
	switch_neighbours()
func switcher():
	if ON == false:
		self.texture_normal = switchON
		ON = true
		root.lightOn()
	elif ON == true:
		self.texture_normal = switchOFF
		ON = false
		root.lightOff()
func switch_neighbours():
	var ids_to_switch = []
	var grid_width = 5
	
# Calculate the neighbours
	var up = switchID - grid_width if switchID > grid_width else 0
	print ("up ",up)
	var down = switchID + grid_width if switchID <= (grid_width * (grid_width - 1)) else 0
	print ("down ",down)
	var left = switchID - 1 if switchID % grid_width != 1 else 0
	print ("left ", left)
	var right = switchID + 1 if switchID % grid_width != 0 else 0
	print ("right ", right)

	if up != 0:
		ids_to_switch.append(up)
	if down != 0:
		ids_to_switch.append(down)
	if left != 0:
		ids_to_switch.append(left)
	if right != 0:
		ids_to_switch.append(right)


	# Switch the state of each neighbour
	for id in ids_to_switch:
		if id == 0:
			continue
		var neighbour = parent.get_node("Switch_" + str(id))
		print (neighbour)
		if neighbour:
			neighbour.switcher()
func reset_state():
	ON = true
	self.texture_normal = switchON

