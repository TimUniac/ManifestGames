extends Node2D

signal toggled(enabled: bool)
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.Input.auto_advance.toggled
	Dialogic.start('tutorial')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


