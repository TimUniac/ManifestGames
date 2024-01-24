extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Box/Item1.visible = false
	$Box/Item2.visible = false
	$Box/Item3.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
