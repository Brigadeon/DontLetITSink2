extends CharacterBody2D

var speed = 10
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		position += ((player.position - position)/speed).normalized()
		

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass
