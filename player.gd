extends CharacterBody2D


var enemy_attack_range = false
var enemy_attack_Cooldown = true
var health = 5
var playerAlive = true

func _physics_process(delta):
	enemyAttack()
	health_range()
	
func boat():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_attack_range = true
		


func enemyAttack():
	if enemy_attack_range:
		health = health - 1 
		print("Took damage", health)

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_attack_range = false

func health_range():
	if health <= 0:
		get_tree().quit()
