extends Node2D

var correct_route = ["Point_1", "Point_15", "Point_5", "Point_14", "Point_2"]
var current_route = []
var points_selected = 0

var green_ring = preload("res://Assets/Texture assets/Chapter 3/GreenRing.png")
var black_ring = preload("res://Assets/Texture assets/Chapter 3/BlackRing.png")
var red_ring = preload("res://Assets/Texture assets/Chapter 3/RedRing.png")

func _ready():
	set_process_input(true)
	print_points_global_position()
	$Schedule.visible = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var closest_point_name = ""
		var min_distance = 100 
		for i in range(1, 18):
			var point = get_node("Point_" + str(i))
			var distance = point.global_position.distance_to(event.global_position)
			if distance < min_distance:
				min_distance = distance
				closest_point_name = "Point_" + str(i)
		
		
		if closest_point_name != "":
			_on_point_selected(closest_point_name)

func _on_point_selected(point_name: String):
	$Clicks.play()
	print("Selected: " + point_name)
	if not current_route.has(point_name):
		current_route.append(point_name) 
		points_selected += 1
		print(current_route, points_selected)
		_update_line()
		_place_ring_on_point(point_name, points_selected)
		if points_selected == 5:
			_check_route()

func _update_line():
	var line_points = PackedVector2Array()
	for point_name in current_route:
		var point = get_node(point_name)
		var local_pos = $Line2D.to_local(point.global_position) 
		line_points.append(local_pos)
	$Line2D.points = line_points

func _check_route():
	
	var is_correct = true
	for i in range(5):
		if current_route[i] != correct_route[i]:
			is_correct = false
			break
	
	if is_correct:
		winstate()
	else:
		reset_game()
func print_points_global_position():
	for i in range(1, 18): 
		var point_path = "Point_" + str(i)  
		var point = get_node_or_null(point_path)
		if point:
			print(point.name, "Global Position:", point.global_position)
		else:
			print("Node not found:", point_path)

func reset_game():
	current_route.clear()
	points_selected = 0
	$Line2D.points = []
	for ring in get_tree().get_nodes_in_group("rings"):
		ring.queue_free()


func winstate():
	print("Solved")
	$'.'.visible = false
	var parent = get_parent()
	parent.mapcompleted()


func _on_close_pressed():
	var parent = $".".get_parent()
	parent.close()


func _on_close_sched_pressed():
	$Schedule.visible = false


func _on_schedule_toggle_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$Schedule.visible = !$Schedule.visible 
		
func _place_ring_on_point(point_name: String, click_number: int):
	var texture
	match click_number:
		1:
			texture = green_ring
		5:
			texture = red_ring
		_:
			texture = black_ring
			
	var sprite = Sprite2D.new()
	sprite.texture = texture
	var point = get_node(point_name)
	sprite.position = point.position
	sprite.scale = Vector2(0.05, 0.05)
	add_child(sprite)
	sprite.add_to_group("rings")
