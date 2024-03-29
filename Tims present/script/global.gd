extends Node

var player_exit_hallway_posx = 0
var player_exit_hallway_posy = 0
var player_start_posx = 0
var player_start_posy = 0

var journalLyricsSeen = false
var guitarPosterSeen = false


func _process(_delta):
	closewindow()
	tutorialJump()
	bedroomJump()
	hallwayJump()
	trainJump()
func closewindow(): 
	if Input.is_action_just_pressed("Close"):
		get_tree().root.mode = Window.MODE_WINDOWED


func tutorialJump():
	if Input.is_action_pressed("tutorJump"):
		get_tree().change_scene_to_file("res://Scenes/Levels/tutorial_level.tscn")

func bedroomJump():
	if Input.is_action_pressed("bedJump"):
		get_tree().change_scene_to_file("res://Scenes/Levels/seraphina_bedroom_male.tscn")
		
func hallwayJump():
	if Input.is_action_pressed("hallJump"):
		get_tree().change_scene_to_file("res://Scenes/highschool_hallway_scene.tscn")

func trainJump():
	if Input.is_action_just_pressed("trainJump"):
		get_tree().change_scene_to_file("res://Scenes/Levels/train_station_scene.tscn")


