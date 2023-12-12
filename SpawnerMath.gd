extends Node2D

var enemyScence = preload("res://bubble_enemy.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	$Timer.start()


func _on_animated_sprite_2d_animation_looped():
	pass # Replace with function body.
	
	
func _on_timer_timeout():
	var enemy = enemyScence.instantiate()
	add_child(enemy)
	print("1")
