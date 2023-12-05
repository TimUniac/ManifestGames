extends Marker2D

func show_timeline(timeline_name: String):
	# Trigger the Dialogic plugin to start the specified timeline
	Dialogic.get_timeline('tutorial').start()

	# Show or animate the dialogue bubble as needed
	show()
