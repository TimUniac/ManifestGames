extends Area2D

@export var item: InvItem
var player = null
var collect = false 
var inReach = false
@export var sprite_texture: Texture
@export var sprite_scale: Vector2 = Vector2(1, 1)
func _ready():
	var sprite: Sprite2D = $Sprite2D

	# Set the texture if provided in the inspector
	if sprite_texture != null:
		sprite.texture = sprite_texture
	sprite.scale = sprite_scale
	

func _on_body_entered(body):
	if body.has_method("player"):
		player = body
		inReach = true

func _input(InputEvent):
	if Input.is_action_just_pressed("Pickup") and inReach:
		collect = true
		print ("input")
		
	if inReach and collect:
		playercollect()
		queue_free()
		print("body")

func playercollect():
	if player:
		player.collect(item)
		print("player")
