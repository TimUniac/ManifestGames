extends Control


var correctTiles: int = 0
var neededTiles: int = 4

func tileCount():
	correctTiles += 1
	if correctTiles == neededTiles:
		var parent = get_parent()
		parent.playercollect()
	else:
		return
