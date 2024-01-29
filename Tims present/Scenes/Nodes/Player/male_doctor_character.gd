extends CharacterBody2D

var Speed: float = 300.0
var current_dir = "none"



@onready var anim = $Sprite2D


@onready var pickup_display = $"../CanvasLayer/PickupDisplay"
@onready var item1_ui = pickup_display.get_node("Box/Item1")
@onready var item2_ui = pickup_display.get_node("Box/Item2")
@onready var item3_ui = pickup_display.get_node("Box/Item3")
@onready var SpeechBubble = $SpeechBubble
@onready var talking = false


func _ready():

	$Sprite2D.play("front_idle")
	print(pickup_display)  # Should not be null
	print(item1_ui)  # Should not be null
	print(item2_ui)  # Should not be null
	print(item3_ui)  # Should not be null

func _physics_process(_delta):
	
	player_movement()
	if item1_ui.visible and item2_ui.visible and item3_ui.visible:
		call_change_scene()
	
		
		
		
	if Input.is_action_pressed("jump"):
		if SpeechBubble.is_visible:
			SpeechBubble.visible = false
			talking = false
			print("not talking")
			
	
func player_movement(): 
	if talking == true:
		print ("stop moving")
		return 
		print ("move again")
	elif Input.is_action_pressed("right"):
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
	
	if dir == "Pickup":
		player()
		
func player():
	pass
	
func collect_item(item_number):
	match item_number:
		1: item1_ui.visible = true
		2: item2_ui.visible = true
		3: item3_ui.visible = true

func call_change_scene():
	print ("NEXT!!!!")
	var root_node = get_tree().get_root().get_node("root")
	if root_node and root_node.has_method("change_scene"):
		root_node.change_scene()
	else:
		print("Root node doesn't have the 'change_scene' method.")
		
	
	
func speak(text):
	SpeechBubble.show_bubble(text)
	SpeechBubble.position = Vector2(-150, -250)
	talking = true

func _on_guitar_interacted(guitarDialogue):
	speak(guitarDialogue)
