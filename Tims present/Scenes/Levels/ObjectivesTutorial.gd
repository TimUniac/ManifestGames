extends TextureRect

var list = false
var glasses = false
var pen= false
@onready var parent = get_parent().get_node("Finish")

func _ready():
	parent.visible = false
func _process(delta):
	hardyboys()
	
func hardyboys():
	if list == true and glasses == true and pen == true:
		parent.visible = true

func foundlist():
	$Label2/Orbs2.visible = true
	list = true
	
func foundglasses():
	$Label/Orbs.visible = true
	glasses = true
func foundpen():
	$Label3/Orbs3.visible = true
	pen = true

