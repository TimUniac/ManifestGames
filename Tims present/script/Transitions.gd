extends Control

#class_name transitioner 

@export var scene_switch_anim : String = "fadeout"
@export var scene_to_load : PackedScene

signal finished

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer
func _ready():
	animation_tex.visible = false

func fadein():
	animation_player.play("fadein")
	
func fadeout():
	animation_player.play("fadeout")


func _on_animation_player_animation_finished(anim_name):
	emit_signal('finished')
