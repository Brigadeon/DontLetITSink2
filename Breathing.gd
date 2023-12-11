extends AnimatedSprite2D

var original_scale = Vector2.ONE
var breathing_range = Vector2(1.1, 0.9)
var breathing_speed = 5
var timer = 0

func _ready():
	original_scale = scale

func _process(delta):
	timer += delta * breathing_speed
	var scale_x = original_scale.x + (breathing_range.x - original_scale.x) * 0.5 * (1.0 + sin(timer))
	var scale_y = original_scale.y + (breathing_range.y - original_scale.y) * 0.5 * (1.0 + sin(timer))
	scale = Vector2(scale_x, scale_y)
