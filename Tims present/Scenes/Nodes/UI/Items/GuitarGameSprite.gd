extends Sprite2D

signal lyricsSeen
func _on_seraphinas_guitar_chords_seen():
	print("sprite sees lyrics tells guitar game")
	emit_signal("lyricsSeen")
