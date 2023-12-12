extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null
var enemyHealth = 3
var enemyRange = false


func _physics_process(delta):
	playerAttack()
	if player_chase and player:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta

func _on_detection_area_body_entered(body):
	if body.has_method("boat"):
		player = body
		player_chase = true

#func _on_detection_area_body_exited(body):
#		player = null
#		player_chase = false

func enemy():
	pass
	
func _on_enemy_hitbox_body_entered(body):
	if body.has_method("boat"):
		enemyRange = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("boat"):
		enemyRange = false

func playerAttack():
	if enemyRange:
		enemyHealth = enemyHealth - 1
		if enemyHealth <= 0:
			queue_free()
