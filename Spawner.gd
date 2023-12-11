extends Node2D

var enemy_scene = preload("res://bubble_enemy.tscn")  # Path to your enemy scene
var path_node = null  # Reference to the Path2D node in the scene
var spawn_interval = 2  # Adjust this value to control spawn frequency
var spawn_timer = 0

func _ready():
	path_node = $Path2D  # Replace "Path2D" with the actual name of your Path2D node
	if not path_node:
			print("Path2D node not found. Please assign it in the editor.")
	else:
		print("Path2D node found.")

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_timer = 0
	spawn_enemy()

func spawn_enemy():
	if not path_node:
		return

	var new_enemy = enemy_scene.instantiate()  # Create an instance of the enemy scene
	var path_follow = PathFollow2D.new()
	path_follow.set_path(path_node)  # Set the PathFollow2D's path property to the Path2D node
	path_follow.set_offset(randf() * path_follow.path_length)  # Set a random offset along the path

	new_enemy.position = path_node.global_position  # Set the initial enemy position to the path's starting point
	new_enemy.add_child(path_follow)  # Attach the PathFollow2D node to the enemy

	add_child(new_enemy)  # Add the enemy to the scene
