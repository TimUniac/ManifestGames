extends GridContainer



	


func _on_reset_pressed():
	for child in get_children():
		print (child)
		if child:
			child.reset_state() 
			
