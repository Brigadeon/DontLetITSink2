extends Node2D

var mathQuizScene = preload("res://bubble_enemy.tscn")
var spawnedMathQuizzes = []
var originalPositions = []
var currentSpawnIndex = 0
var quizCount = 0
var quizResetInterval = 5
var math_questions = []
var horizontalSpacing = 200
var quizSpawnPosition = Vector2(518, 100)
var player_position = Vector2(903, 770)
var speed = 100

func _ready():
	$Timer.start()

func _on_timer_timeout():
	spawn_quiz()

func spawn_quiz():
	var mathQuizInstance = mathQuizScene.instantiate()
	add_child(mathQuizInstance)
	var xPosition = currentSpawnIndex * horizontalSpacing
	var yPosition = 0
	mathQuizInstance.global_position = Vector2(xPosition, yPosition)
	mathQuizInstance.global_position = quizSpawnPosition
	spawnedMathQuizzes.append(mathQuizInstance)
	currentSpawnIndex += 1

func _process(delta):
	for i in range(spawnedMathQuizzes.size()):
		var quiz = spawnedMathQuizzes[i]
		var direction = (player_position - quiz.global_position).normalized()
		quiz.global_position += direction * speed * delta  # Move quizzes towards player


func _on_button_pressed():
	var playerAnswer = $LineEdit.text
	var lineEdit = $LineEdit
	var i = 0
	while i < spawnedMathQuizzes.size():
		var quiz = spawnedMathQuizzes[i]
		if quiz:
			var isCorrect = quiz.check_answer(playerAnswer)
			if isCorrect:
				print("Answer for quiz", i, "is correct!")
				quiz.queue_free()  # Remove the node if answered correctly
				spawnedMathQuizzes[i] = null  # Mark the item for removal
			else:
				print("Answer for quiz", i, "is incorrect!")
			i += 1  # Move to the next quiz
		else:
			print("Quiz", i, "has been removed or does not exist.")
			i += 1
			
	spawnedMathQuizzes = filter_valid_items(spawnedMathQuizzes)
	
	lineEdit.text = ""
	
func filter_valid_items(array):
	var filteredArray = []
	for item in array:
		if item != null:
			filteredArray.append(item)
	return filteredArray
