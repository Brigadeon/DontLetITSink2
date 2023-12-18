extends Node2D

var mathQuizScene = preload("res://bubble_enemy.tscn")
var spawnedMathQuizzes = []
var originalPositions = []
var quizCount = 0
var quizLimit = 5 
var quizResetInterval = 5
var math_questions = []
var player_position = Vector2(1651, 579)
var speed = 100

func _ready():
	$Timer.start()

func _on_timer_timeout():
	spawn_quiz()

func spawn_quiz():
	var mathQuizInstance = mathQuizScene.instantiate()
	add_child(mathQuizInstance)
	mathQuizInstance.global_position = Vector2(randi() % 800, -50)  # Randomize X position, spawn above the screen
	spawnedMathQuizzes.append(mathQuizInstance)


func reset_quiz_positions():
	for i in range(originalPositions.size()):
		spawnedMathQuizzes[i].global_position = originalPositions[i]

func _process(delta):
	var i = 0
	while i < spawnedMathQuizzes.size():
		var math_question = spawnedMathQuizzes[i]
		var direction = (player_position - math_question.global_position).normalized()
		math_question.global_position += direction * speed * delta  # Move quizzes towards player
		
		if math_question.global_position.y < -100:  # If quiz is below the screen
			math_question.queue_free()  # Remove from the scene
			spawnedMathQuizzes.remove(i)  # Remove from list
			spawn_quiz()  # Respawn a new quiz
		else:
			i += 1
			

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
