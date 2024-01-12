extends TextureRect

func _process(delta):
	$Text
	if (Input.is_action_pressed("Interact")):
		docTalk()
	if (Input.is_action_pressed("up")):
		seraTalk()
func docTalk():
	$Name.append_bbcode("[b][font=Noto Sans][color=gray][size=7]Doctor[/size][/color][/font][/b]")
	
func seraTalk():
	$Name.append_bbcode("[b][font=Noto Sans][color=gray][size=7]Seraphina[/size][/color][/font][/b]")
