extends Control

var pages = ["res://UI_JournalPage5_V2 1.png" ]  
var current_page = 0  # Start with the first page

func _ready():
	update_page()
	
func _process(_delta):
	pass

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
					global.journalLyricsSeen = true
			elif event.keycode == KEY_LEFT:
				if current_page > 0:
					current_page -= 1
					update_page()




func _on_close_pressed():
	var parent = get_parent()
	var gramp = parent.get_parent()
	gramp.close()
	
