extends Node2D


var operand1 = 0
var operand2 = 0
var operation = 0
var correctAnswer = 0

func _ready():
	generate_question()

func generate_question():
	operand1 = randi() % 10 + 1 # Random number between 1 and 10
	operand2 = randi() % 10 + 1 # Random number between 1 and 10
	operation = randi_range(1, 2) # 1: Addition, 2: Subtraction

	if operation == 1:
		correctAnswer = operand1 + operand2
		$Label.text = str(operand1) + " + " + str(operand2)
	else:
		# Ensure operand1 is greater than operand2 for non-negative results
		while operand1 < operand2:
			operand1 = randi() % 10 + 1
			operand2 = randi() % 10 + 1
		correctAnswer = operand1 - operand2
		$Label.text = str(operand1) + " - " + str(operand2)

