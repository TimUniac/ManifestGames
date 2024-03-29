extends AudioStreamPlayer

var groundSounds ={
	"office":[
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_1.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_2.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_3.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_4.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_5.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_6.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_7.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_8.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_9.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_10.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_11.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_12.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_13.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_14.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_15.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_16.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_17.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_18.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_19.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_20.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_21.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_22.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_23.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_24.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_25.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_26.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_27.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_28.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_29.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_30.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_31.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Office/Office_32.mp3")
	],
	"bedroom":[
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_1.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_2.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_3.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_4.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_5.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_6.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_7.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_8.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_9.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_10.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_11.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_12.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_13.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_14.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_15.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_16.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_17.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_18.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_19.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Bedroom/Bedroom_20.mp3")
	],
	"hallway":[
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_1.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_2.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_3.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_4.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_5.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_6.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_7.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_8.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_9.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_10.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_11.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_12.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_13.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_14.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_15.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_16.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_17.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_18.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_19.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Hallway/Hallway_20.mp3"),
	],
	"platform":[
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_1.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_2.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_3.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_4.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_5.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_6.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_7.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_8.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_9.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_10.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_11.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_12.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_13.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_14.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Platform/Platform_15.mp3")
	],
	"parking":[
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_1.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_2.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_3.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_4.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_5.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_6.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_7.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_8.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_9.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_10.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_11.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_12.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_13.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_14.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/ParkingLot/ParkingLot_15.mp3")
	],
	"gravel":[
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_1.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_2.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_3.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_4.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_5.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_6.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_7.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_8.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_9.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_10.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_11.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_12.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_13.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_14.mp3"),
		preload("res://Assets/Sound/SFX/Footfalls/Gravel/Gravel_15.mp3"),
		
	]
	}
var currentGround = "office"
var activeGround = "office"
func groundMaterial():
	
	var activeGround = groundSounds[currentGround] if currentGround in groundSounds else []
	if activeGround:
		var random_sound = activeGround[randi() % activeGround.size()]
		return random_sound
	return null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_volume_db(-30)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"..".talking == true:
		return
	if Input.is_action_pressed("right") or Input.is_action_pressed("left") or Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		print("stepping")
		print (activeGround)
		var audio_stream = groundMaterial()

		if audio_stream and not self.playing:
			self.stream = audio_stream
			self.play()
