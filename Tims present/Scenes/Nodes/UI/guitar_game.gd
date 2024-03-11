extends Control

var secret_code = "6415"
var entered_code = ""
var audio_queue = []
signal changeSong
@onready var clue = $Clue
@onready var chords = $Clue2
@onready var bigHint = $BigHint
@onready var wrong_answer = preload("res://Assets/Sound/Music/WrongAnswerGuitar.mp3")
@onready var audio_player = $Chords
@onready var audio_files = {
	KEY_1: preload("res://Assets/Sound/SFX/Sounds-Guitar/G.wav"),
	KEY_2: preload("res://Assets/Sound/SFX/Sounds-Guitar/a min.wav"),
	KEY_3: preload("res://Assets/Sound/SFX/Sounds-Guitar/b min.wav"),
	KEY_4: preload("res://Assets/Sound/SFX/Sounds-Guitar/C.wav"),
	KEY_5: preload("res://Assets/Sound/SFX/Sounds-Guitar/D.wav"),
	KEY_6: preload("res://Assets/Sound/SFX/Sounds-Guitar/e min.wav"),
	KEY_7: preload("res://Assets/Sound/SFX/Sounds-Guitar/F#.wav")
}

func _ready():
	bigHint.visible = false
	audio_player.stop()
	clue.visible = true
	chords.visible = false
	if global.journalLyricsSeen == true:
		displayChords()
	if global.guitarPosterSeen:
		bigHint.visible = true
func _process(_delta):
	if global.guitarPosterSeen == true:
		bigHint.visible = true
func _input(event):
	if event is InputEventKey and event.pressed:
		var audio_stream = audio_files.get(event.keycode)
		print ("gotStream")
		if audio_stream:
			print ("stream")
			if audio_player.is_playing:
				print ("is it playing?")
				audio_player.stop()
				print ("Stop")
				audio_player.stream = audio_stream
				audio_player.play()
				print("play")
	if event is InputEventKey and event.pressed and !event.echo:
		if event.keycode == KEY_1:
			_append_number_to_code(1)
			#PLAY G Chord
		elif event.keycode == KEY_2:
			_append_number_to_code(2)
			#PLAY
		elif event.keycode == KEY_3:
			_append_number_to_code(3)
		elif event.keycode == KEY_4:
			_append_number_to_code(4)
		elif event.keycode == KEY_5:
			_append_number_to_code(5)
		elif event.keycode == KEY_6:
			_append_number_to_code(6)
		elif event.keycode == KEY_7:
			_append_number_to_code(7)
			
		elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			_on_EnterButton_pressed()
		elif event.keycode == KEY_BACKSPACE and entered_code != "":
			entered_code = entered_code.substr(0, entered_code.length() - 1)
			$GuitarSequenceInput.text = entered_code


func _append_number_to_code(number):
	if entered_code.length() < 4:
		entered_code += str(number)
		$GuitarSequenceInput.text = entered_code
		var audio_stream = audio_files.get("KEY_" + str(number))
		if audio_stream:
			audio_queue.append(audio_stream)
			

func _play_next_in_queue():
	if audio_queue.size() > 0:
		var next_audio = audio_queue.pop_front()
		audio_player.stream = next_audio
		audio_player.play()
	else:
		audio_player.disconnect("finished", Callable(self, "_play_next_in_queue"))
		if entered_code != secret_code:
			audio_player.stream = wrong_answer
			audio_player.play()
		entered_code = ""
		$GuitarSequenceInput.clear()

func _on_EnterButton_pressed():
	if entered_code.length() == 0:
		return
		audio_player.connect("finished", Callable(self, "_play_next_in_queue"))
		_play_next_in_queue()
	if entered_code == secret_code:
		print("Code Correct!")
		
		var parent = get_parent()
		if parent and parent.has_method("playercollect"):
			parent.playercollect()
			parent.close()
			

		else:
			print("Parent node doesn't have the 'playercollect' method.")
		#PLAY SONG
		# Add more feedback here
	else:
		print("Incorrect Code")
		entered_code = ""
		var audio_stream = wrong_answer
		if audio_stream:
			print ("stream")
			if audio_player.is_playing:
				print ("is it playing?")
				audio_player.stop()
				print ("Stop")
				audio_player.stream = wrong_answer
				audio_player.play()
		
		$GuitarSequenceInput.clear()

func displayChords():
	print ("Guitar Change")
	chords.visible = true
	clue.visible = false
	



func _on_close_pressed():
	var parent = get_parent()
	parent.close()
