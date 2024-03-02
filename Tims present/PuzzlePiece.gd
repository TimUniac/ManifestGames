extends Sprite2D

var dragging = false
var clickAndDragOffset = Vector2()
var snapThreshold = 10
var activePiece = null

func _ready():
	set_process_input(true)

func _process(_delta):
	if dragging: 
		return
	var snap_points = get_tree().get_nodes_in_group("PiecePlaces")
	for point in snap_points:
		if position.distance_to(point.position) < snapThreshold:
			position = point.position
			set_process_input(false)
			break

func is_point_in_sprite(sprite, point):
	var sprite_rect = Rect2(sprite.position - sprite.texture.get_size() * sprite.scale * 0.5, sprite.texture.get_size() * sprite.scale)
	return sprite_rect.has_point(point)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var highest_z_index = -1
				var clicked_pos = to_local(event.position)
				for piece in get_tree().get_nodes_in_group("pieces"): 
					if piece.get_rect().has_point(piece.to_local(event.position)) and piece.z_index > highest_z_index:
						highest_z_index = piece.z_index
						activePiece = piece
				if activePiece:
					activePiece.dragging = true
					activePiece.clickAndDragOffset = clicked_pos - activePiece.position
					activePiece.z_index = 1 
			else:
				if activePiece:
					activePiece.dragging = false
					activePiece.z_index = 0 
					activePiece = null 
	elif event is InputEventMouseMotion and activePiece and activePiece.dragging:
		activePiece.position = activePiece.to_local(event.position) - activePiece.clickAndDragOffset
