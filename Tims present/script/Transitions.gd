extends Control

@export var scene_switch_anim : String = "fadeout"
@export var scene_to_load : PackedScene


@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer
func _ready():
	animation_tex.visible = false

func set_next_scene(fading_out: bool):
	if(fading_out):
		animation_player.queue("fadeout")
	else:
		animation_player.queue("fadein")
		

func _on_animation_player_animation_finished(anim_name):
	if(scene_to_load != null && anim_name == scene_switch_anim):
		get_tree().change_scene_to_packed(scene_to_load)
