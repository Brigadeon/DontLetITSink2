extends AnimatedSprite2D

var original_position = Vector2.ZERO
var wobble_range = 2.0
var wobble_speed = 5.0
var timer = 0.0

func _ready():
	original_position = position

func _process(delta):
	timer += delta * wobble_speed
	var offset = wobble_range * sin(timer)
	position.x = original_position.x + offset
