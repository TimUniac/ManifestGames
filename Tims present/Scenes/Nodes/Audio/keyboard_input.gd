extends AudioStreamPlayer2D


const SOUND_BASE_PATH = "res://Assets/Sound/SFX/GuitarPickSounds/GuitarPick__"
var sound_players = []
var is_muted = true

func _ready():
	for i in range(26): 
		set_volume_db(-20.0)
		var sound_path = SOUND_BASE_PATH + str(i) + ".wav" 
		var sound_player = AudioStreamPlayer.new()
		sound_player.stream = load(sound_path)
		add_child(sound_player)
		sound_players.append(sound_player)

func _input(event):
	set_volume_db(-20.0)
	if not is_muted and event is InputEventKey and event.pressed:
		# Handle alphanumeric input.
		if event.keycode >= KEY_A and event.keycode <= KEY_Z:
			# A-Z: 0-25
			play_sound(event.keycode - KEY_A)
		elif event.keycode >= KEY_0 and event.keycode <= KEY_9:
			# 0-9: 0-9
			play_sound(event.keycode - KEY_0)

func play_sound(index):
	if index >= 0 and index < sound_players.size():
		sound_players[index].play()

func mute(mute_state):
	is_muted = mute_state
	for sound_player in sound_players:
		if mute_state:
			sound_player.stop()
		else:
			pass
