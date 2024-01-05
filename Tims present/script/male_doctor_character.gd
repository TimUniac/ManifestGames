extends CharacterBody2D

var Speed: float = 300.0
var current_dir = "none"
@export var collected_items: int = 0
@export var inv : Inv
@onready var anim = $Sprite2D
@onready var interaction_area: InteractionArea = $"Interaction Area"


func _ready():
	$Sprite2D.play("front_idle")
	interaction_area.interact = Callable(self, "_on_interact")
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _physics_process(_delta):
	player_movement()

func _on_dialogic_signal(argument:String):
	if argument == "1":
		Speed = 0
	elif argument == "unFreeze":
		Speed = 300
	
func player_movement(): 
	if Input.is_action_pressed("right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = Speed
		velocity.y = 0
		
	
	elif Input.is_action_pressed("left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -Speed
		velocity.y = 0
	
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = Speed
		velocity.x = 0
		
	elif Input.is_action_pressed("up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -Speed
		velocity.x = 0

	
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()	
	
func play_anim(movement):
	var dir = current_dir
	var anim = $Sprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_march")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_march")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "up":
		if movement == 1:
			anim.play("Backward_march")
		elif movement == 0:
			anim.play("back_idle")
	if dir == "down":
		
		if movement == 1:
			anim.play("Forward_March")
		elif movement == 0:
			anim.play("front_idle")
func player():
	pass
	
func collect(item):
	collected_items += 1
	inv.insert(item)
	print("Item collected!")
	if collected_items == 3:
		get_tree().change_scene_to_file("res://Scenes/male_office.tscn")
	
	

