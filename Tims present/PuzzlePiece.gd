extends Sprite2D

var dragging = false

func _ready():
	# Connect signals using the Callable syntax for better clarity and correctness
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _input(event):
	if dragging and event is InputEventMouseMotion:
		position += event.relative

func _on_mouse_entered():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): # Or MOUSE_BUTTON_LEFT for Godot 3.4 and later
		dragging = true

func _on_mouse_exited():
	dragging = false
