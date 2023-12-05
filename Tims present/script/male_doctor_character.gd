extends CharacterBody2D

const Speed: float = 300.0
var current_dir = "none"

@export var inv : Inv
@onready var anim = $Sprite2D

#Dialogic Stuff
var dialogue_bubble: Marker2D
var character_body: CharacterBody2D
var dialogue_triggered: bool = false

func _ready():
	$Sprite2D.play("front_idle")
#More Dialogic BS
	dialogue_bubble = $BubbleMark  # Reference to the DialogueBubble node
	dialogue_bubble.hide()  # Optional: Hide the dialogue bubble initially
	character_body = $"."
	
func _process(delta):
	# Check if the player has moved in any direction
	if not dialogue_triggered:
		if Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
				on_player_first_move()
				dialogue_triggered = true
func _physics_process(_delta):
	player_movement()

func on_player_first_move():
	character_body.show_dialogue_bubble("tutorial")

func show_dialogue_bubble(timeline_name: String):
	dialogue_bubble.show_timeline('tutorial')
		

	
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
	inv.insert(item)
	


