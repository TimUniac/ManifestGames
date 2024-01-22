extends HSlider

var master_bus = AudioServer.get_bus_index("Master")
var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")
var Dialogue_bus = AudioServer.get_bus_index("Dialogue")




func _on_master_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)


func _on_voice_value_changed(value):
	AudioServer.set_bus_volume_db(Dialogue_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(Dialogue_bus, true)
	else:
		AudioServer.set_bus_mute(Dialogue_bus, false)


func _on_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(sfx_bus, true)
	else:
		AudioServer.set_bus_mute(sfx_bus, false)


func _on_music_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)
