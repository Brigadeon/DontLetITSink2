extends Node2D


var operand1 = 0
var operand2 = 0
var operation = 0
var correctAnswer = 0
signal press


func _ready():
	generate_question()

func generate_question():
	operand1 = randi() % 10 + 1 # Random number between 1 and 10
	operand2 = randi() % 10 + 1 # Random number between 1 and 10
	operation = randi_range(1, 2) # 1: Addition, 2: Subtraction

	if operation == 1:
		correctAnswer = operand1 + operand2
		$Label.text = str(operand1) + " + " + str(operand2) + " = ?"
	else:
		# Ensure operand1 is greater than operand2 for non-negative results
		while operand1 < operand2:
			operand1 = randi() % 10 + 1
			operand2 = randi() % 10 + 1
		correctAnswer = operand1 - operand2
		$Label.text = str(operand1) + " - " + str(operand2) + " = ?"

func check_answer():
	var playerAnswer = $LineEdit.text.strip_edges() # Get player's answer

	if playerAnswer == "":
		print("Please enter a valid number.")
		return

	var intAnswer = playerAnswer.to_int()
	if intAnswer != null:
		if intAnswer == correctAnswer:
			print("Correct!")
			generate_question()  # Generate a new question after a correct answer
		else:
			print("Incorrect. Try again.")
	else:
		print("Please enter a valid number.")

	$LineEdit.text = ""  # Clear the LineEdit after processing the answer

func _on_button_pressed():
	press.emit()
	print("Button Pressed")
	check_answer()


func _on_line_edit_text_changed(new_text):
	pass # Replace with function body.
