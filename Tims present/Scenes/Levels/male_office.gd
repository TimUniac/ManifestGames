extends Node2D

@onready var audio_stream_player = $OfficeTheme
@onready var inv: Inv = preload("res://Scenes/Nodes/UI/playerinv.tres")

func _ready():
	audio_stream_player.playing = true





