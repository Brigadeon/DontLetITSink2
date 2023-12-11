extends Node2D

var Speed = 1

func _ready():
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	SceneTransition.change_scene_to_file("res://World.tscn")
