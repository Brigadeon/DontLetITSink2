extends ParallaxLayer

var original_y: float
var amplitude = 5.0 
var speed = 2.0  
var time_passed = 0.0

func _ready():
	original_y = position.y  

func _process(delta):
	time_passed += delta  
	position.y = original_y + amplitude * sin(time_passed * speed)
