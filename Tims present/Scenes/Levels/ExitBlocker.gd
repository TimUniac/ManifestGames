extends StaticBody2D

@onready var doctor = get_parent().get_node("Male Doctor Character")
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"
@onready var BlockerDialogue: String = "I must turn off the lights, solve the map, and collect the puzzle to move forward."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		doctor.speak(BlockerDialogue)
