extends Node2D
class_name math

@onready var input_num = %inputNum

var math_instance = null
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

func check_answer():
	var lineEdit = get_tree().get_first_node_in_group("inputNum")
	var playerAnswer = lineEdit.text.strip_edges() # Get player's answer

	var intAnswer = playerAnswer.to_int()
	if intAnswer != null:
		if intAnswer == correctAnswer:
			print("Correct!")
			queue_free()  # Generate a new question after a correct answer

	lineEdit.text = ""  # Clear the LineEdit after processing the answer

func _on_button_pressed():
	print("Button Pressed")
	check_answer()
