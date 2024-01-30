extends Resource

#class_name Inv

#signal update

#@export var slots: Array[InvSlot]

#func insert(item: InvItem):
#	var itemslots = slots.filter(func(slot): return slot.item == item)
#	if !itemslots.is_empty():
#		itemslots[0].amount += 1
#	else:
##		if !emptyslots.is_empty():
##			emptyslots[0].amount = 1
#		update.emit()
