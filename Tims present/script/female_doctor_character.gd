extends CharacterBody2D

const Speed: float = 300.0
var motion = Vector2()
@onready var anim = $Sprite2D
var enemy_in_attack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var attackip = false

	
func _physics_process(_delta):
	enemy_attack()
	attack()
	
	if health <= 0:
		player_alive = false
		health = 0 
		print("player as been killed")
		get_tree().reload_current_scene()
		
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	var boss = Input.is_action_pressed("Boss Battle")
	
	
	var lateral_direction = Input.get_axis("left", "right")
	if lateral_direction:
		velocity.x = lateral_direction * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
		
	var vertical_direction = Input.get_axis("up", "down")
	if vertical_direction:
		velocity.y = vertical_direction * Speed
	else:
		velocity.y = move_toward(velocity.y, 0, Speed)
		
	
	if right: 
		anim.play("right_march")
		motion.x = Speed
	if left: 
		anim.play("left_march")
		motion.x = Speed
	if up:
		anim.play("Backward_march")
		motion.y = Speed
	if down:
		anim.play("Forward_March")
		motion.y = Speed
	if boss:
		get_tree().change_scene_to_file("res://In progress/boss_battle_1.tscn")
	else:
		anim.play()
 
	move_and_slide()


func player():
	pass
	
func _on_player_hitbox_body_entered(body):
	if body.has_method("memory_ememy"):
		enemy_in_attack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("memory_ememy"):
		enemy_in_attack_range = false
		
func enemy_attack():
	if enemy_in_attack_range and enemy_attack_cooldown == true:
		health = health - 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health) 


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

func attack():
	if Input.is_action_just_pressed("Attack"):
		global.player_current_attack = true
		attackip = true
		$deal_attack_timer.start()
		
		

func _on_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attackip = false


func update_health():
	var healthbar = $HealthBar
	healthbar.value = health
	
	if health >= 100: 
		healthbar.visible = false
	else:
		healthbar.visible = true
	
	
	
func _on_regen_timer_timeout():
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0
