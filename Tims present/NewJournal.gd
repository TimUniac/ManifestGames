extends Control

var pages = ["res://Assets/AvaJournal.png", "res://Assets/LyricJournal.png","res://Assets/CarmillaJournal1.png","res://Assets/CarmillaJournal2.png"]  # Your page contents
var current_page = 0  # Start with the first page

func _ready():
	update_page()

func _process(delta):
	$Backward.disabled = current_page == 0
	$Forward.disabled = current_page == pages.size() - 1

func update_page():
	var texture = load(pages[current_page])
	if texture:  # Check if the texture was successfully loaded
		$Page.texture = texture
	else:
		print("Failed to load texture from path: ", pages[current_page])

func _input(event):
	if event is InputEventKey:
		if event.pressed and not event.echo:
			if event.keycode == KEY_RIGHT:
				if current_page < pages.size() - 1:
					current_page += 1
					update_page()
			elif event.keycode == KEY_LEFT:
				if current_page > 0:
					current_page -= 1
					update_page()



func _on_forward_pressed():
	if current_page < pages.size() - 1:
					current_page += 1
					update_page()
					



func _on_backward_pressed():
	if current_page > 0:
					current_page -= 1
					update_page()
					



func _on_close_pressed():
	var parent = get_parent()
	parent.close()
	
