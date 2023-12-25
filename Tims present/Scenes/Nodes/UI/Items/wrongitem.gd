extends Area2D

@export var item: InvItem
var player = null

@export var inReach = false

@export var sprite_texture: Texture
@export var sprite_scale: Vector2 = Vector2(1, 1)
func _ready():
	# Access the Sprite2D child
	var sprite: Sprite2D = $Sprite2D

	# Set the texture if provided in the inspector
	if sprite_texture != null:
		sprite.texture = sprite_texture
	sprite.scale = sprite_scale

func _process(delta):
	pass
	

func _on_body_entered(body):
	if body.has_method("player"):
		player = body
		inReach = true

func _input(InputEvent):
	if Input.is_action_just_pressed("Pickup") and inReach:
		for child in get_children():
			if child.has_method("play_random_sound"):
				child.play_random_sound()

