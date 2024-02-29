extends CharacterBody2D

var Speed: float = 300.0
var current_dir = "none"



@onready var anim = $Sprite2D
var pen = false
var glasses = false
var files = false
var guitar = false
var necklace = false
var book = false


@onready var SpeechBubble = $SpeechBubble

var talking = false
signal all_items_collected



func _ready():
	
	$Sprite2D.play("front_idle")

	
func _physics_process(_delta):
	
	check_done()
	player_movement()
		
	if Input.is_action_pressed("jump"):
		if SpeechBubble.is_visible:
			SpeechBubble.visible = false
			talking = false
	elif Input.is_action_pressed("Interact") and SpeechBubble.is_visible:
		SpeechBubble.hide_bubble()
			
			
	
func player_movement(): 
	if talking == true:
		
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

func check_done():
	if guitar and necklace and book:
		emit_signal("all_items_collected")

	elif pen and glasses and files:
		emit_signal("all_items_collected")
		
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






	
	
func speak(text):
	SpeechBubble.show_bubble(text)
	SpeechBubble.position = Vector2(-150, -250)
	talking = true
	

func _on_guitar_interacted(guitarDialogue):
	speak(guitarDialogue)
	
func _on_necklace_interacted(necklaceDialogue):
	speak(necklaceDialogue)

func _on_journal_interacted(journalDialogue):
	speak(journalDialogue)

func _on_book_interacted(bookDialogue):
	speak(bookDialogue)
	
func _on_tutorial_interacted(tutorialDialogue):
	speak(tutorialDialogue)


func _on_pen_item_collected():
	
	pen = true
	print ("Pen")
	
	


func _on_glasses_item_collected():
	
	glasses = true
	print ("glasses")
func _on_files_item_collected():
	
	files = true
	print ("files")

func _on_seraphinas_guitar_item_collected():
	
	guitar = true
	print ("guitar")
	
func _on_novel_item_collected():
	
	book = true
	print ("book")

func _on_friendship_necklace_item_collected():
	
	necklace = true
	print ("necklace")
