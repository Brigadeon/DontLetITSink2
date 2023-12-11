extends CharacterBody2D

var enemy_attack_range = false
var enemy_attack_Cooldown = true
var health = 5
var playerAlive = true

func _physics_process(delta):
	enemyAttack()
	
func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_attack_range = true
		
func enemyAttack():
	if enemy_attack_range:
		health = health - 1
		print("player took 1 damage")
