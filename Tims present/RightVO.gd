extends AudioStreamPlayer


var sound_array: Array = [
	preload("res://Assets/VO/Right/IThinkThisIsIt.mp3"),
	preload("res://Assets/VO/Right/ThereItIs.mp3"),
	preload("res://Assets/VO/Right/ThisIsPerfect.mp3"),
	preload("res://Assets/VO/Right/ThisLooksRight.mp3"),
	preload("res://Assets/VO/Right/YesThisIsIt.mp3")
	# ... add more sounds as needed
]

func _ready():
	pass


func play_random_sound():
	if sound_array.size() > 0:
		var random_index = randi() % sound_array.size()
		var random_sound: AudioStream = sound_array[random_index]

		# Set the random sound to the AudioStreamPlayer and play it
		$".".stream = random_sound
		$".".play()
	else:
		print("Sound array is empty. Please add audio streams.")
