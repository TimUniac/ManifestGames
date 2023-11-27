extends StaticBody2D

signal door_opened
@onready var anim = $"../StaticBody2D/AnimatedSprite2D"

var keytaken : bool = false
var in_Door_Zone : bool = false


func _on_area_2d_body_entered(_body: CharacterBody2D):
	if keytaken == false:
		keytaken = true
		$Sprite2D.queue_free()


func _process(delta):
	if keytaken == true:
		if in_Door_Zone == true:
			if Input.is_action_just_pressed("ui_accept"):
				print("door_opened")
				emit_signal("door_opened")
				get_tree().change_scene_to_file("res://In progress/doctors_office_male.tscn")


	in_Door_Zone = true
	print(in_Door_Zone)

func _on_door_zone_body_exited(body: CharacterBody2D):
	in_Door_Zone = false
	print(in_Door_Zone)

func _on_door_zone_body_entered(body: CharacterBody2D):
	in_Door_Zone = true
	print(in_Door_Zone)

