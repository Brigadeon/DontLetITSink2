extends CharacterBody2D
class_name Enemy
@onready var input_num = %inputNum

signal answered_correctly
var math_instance = null
var operand1 = 0
var operand2 = 0
var operation = 0
var correctAnswer = 0

var speed = 100
var player
var enemyHealth = 3
var enemyRange = false

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
		# Ensure non-negative results
		while operand1 < operand2:
			operand1 = randi() % 10 + 1
			operand2 = randi() % 10 + 1
		correctAnswer = operand1 - operand2
		$Label.text = str(operand1) + " - " + str(operand2)

func check_answer(playerAnswer):
	var trimmedAnswer = playerAnswer.strip_edges()
	var intAnswer = int(trimmedAnswer) if trimmedAnswer != "" else null
	if intAnswer != null and intAnswer == correctAnswer:
		emit_signal("answered_correctly")
		queue_free()
		return true	
	return false

func _physics_process(delta):
	playerAttack()
	if player == null: get_tree().get_nodes_in_group("boat")
	
func enemy():
	pass
	
func _on_enemy_hitbox_body_entered(body):
	if body.has_method("boat"):
		enemyRange = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("boat"):
		enemyRange = false

func playerAttack():
	if enemyRange:
		enemyHealth = enemyHealth - 1
		if enemyHealth <= 0:
			queue_free()
