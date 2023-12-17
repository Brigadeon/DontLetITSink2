extends Node2D

var enemyScence = preload("res://bubble_enemy.tscn")

func _ready():
	$Timer.start()

func _on_timer_timeout():
	var enemy3 = enemyScence.instantiate()
	add_child(enemy3)
